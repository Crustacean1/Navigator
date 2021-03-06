from fastapi import FastAPI, Response, Cookie, Request
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional
import mysql.connector
import random
import string

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
    "http://localhost/",
    "http://localhost:8000/",
    "*"
],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
class LoginData(BaseModel):
    login: str
    password: str

class TokenData(BaseModel):
    token: str


def getDb():
    return mysql.connector.connect(host="localhost",port=3307,database="Navigator",user="root",password="plsnohack")
def getUserFromToken(token: str):
    session = getDb()
    cursor = session.cursor()
    sqlQuery = "SELECT userId FROM Sessions WHERE token=%s AND timestampdiff(HOUR,Sessions.loginDate,NOW())<5 AND active=1"
    cursor.execute(sqlQuery,(token,))
    rows = cursor.fetchall()
    if len(rows)==1:
        return rows[0][0] 
    return -1


@app.post("/")
def hello_world():
    return {"woo": "foo"}

@app.post("/verification")
def verify_user(loginData: LoginData):
    """ function to obtain token lasting 1h, authenticating user to access his data """
    session = getDb()    

    cursor = session.cursor()
    sqlQuery = "SELECT id FROM Users where password=%s and login=%s"
    cursor.execute(sqlQuery,(loginData.password,loginData.login))
    rows = cursor.fetchall()

    if len(rows) > 0:
        userId = rows[0][0]
        randomToken = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(64))
        sqlQuery = "UPDATE Sessions SET active=0 WHERE userId = %s AND timestampdiff(HOUR,Sessions.loginDate,NOW())<5"
        cursor.execute(sqlQuery,(userId,))
        sqlQuery = "INSERT INTO Sessions (userId,loginDate,token,active) values (%s,NOW(),%s,1)"
        cursor.execute(sqlQuery,(userId,randomToken))
        session.commit()
        session.close()
        return {"login_status":"success","token":randomToken,"userId":rows[0][0]}

    return {"login_status": "permission denied","token":"","userId":-1}

@app.post("/testverificationtoken")
def test_token(tok: TokenData):
    """ function to retrieve tables"""
    userId = getUserFromToken(tok.token)
    if userId == -1:
        return {"data":"reeeeee, get away from my data"}
    return {"data":"here you go kind sir","userId":userId}

class TableRequest(BaseModel):
   token: str
   month: str
   year: str
   
@app.post("/monthlyreport")
def monthly_report(req: TableRequest):
    userId = getUserFromToken(req.token)
    if userId == -1:
        return {"status":"permission denied"}
    db = getDb()
    cursor = db.cursor()
    fields = ["invoiceId","contractorType","contractorNip","idCardNumber","transactionDate","registrationDate","notes","pit17","pit15","pit12","pit10","pit85","pit55","pit03"]
    sqlQuery = "SELECT "+ ",".join(fields) + " FROM Invoices WHERE userId=%s AND MONTH(transactionDate)=%s AND YEAR(transactionDate)=%s"
    cursor.execute(sqlQuery,(userId,req.month,req.year))
    rows = cursor.fetchall()
    result = []
    for row in rows:
        i = 0
        result.append(dict())
        for val in row:
            result[-1][fields[i]] = val
            i+=1
    return {"userId": userId,"table":result}

class InvoiceAddReq(BaseModel):
    token: str

    contractorType: str
    contractorNip: str
    idCardNumber: str
    transactionDate: str
    registrationDate: str
    pit17: Optional[int]
    pit15: Optional[int]
    pit12: Optional[int]
    pit10: Optional[int]
    pit85: Optional[int]
    pit55: Optional[int]
    pit03: Optional[int]
    notes: Optional[str]
    

@app.post("/addinvoice")
def add_invoice(req:InvoiceAddReq):
    userId = getUserFromToken(req.token)
    if userId == -1:
        return {"status":"permission denied"}
    db = getDb()
    cursor = db.cursor()
    sqlQuery = "INSERT INTO Invoices (userId,contractorType,contractorNip,idCardNumber,transactionDate,registrationDate,pit17,pit15,pit12,pit10,pit85,pit55,pit03,notes) value (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    #eursor.execute(sqlQuery,(req.contractorType,req.contractorNip,req.idCardNumber,req.transactionDate,req.registrationDate,req.pit,req.notes))
    try:
        cursor.execute(sqlQuery,(userId,req.contractorType,req.contractorNip,req.idCardNumber,req.transactionDate,req.registrationDate,req.pit17 or 0,req.pit15 or 0,req.pit12 or 0,req.pit10 or 0,req.pit85 or 0,req.pit55 or 0,req.pit03 or 0, req.notes or ""))
    except Exception as e:
        return {"status":1,"desc":"failed to write to db"}
    db.commit()
    db.close()
    return {"status":0}

class SummaryReq(BaseModel):
    token: str

    month: str
    year: str
    
@app.post("/summary")
def get_summary(req: SummaryReq):
    userId = getUserFromToken(req.token)
    if userId == -1:
        return {"status":"permission denied"}
    db = getDb()
    cursor = db.cursor()
    sqlQuery = "SELECT SUM(pit17),SUM(pit15),SUM(pit12),SUM(pit10),SUM(pit85),SUM(pit55),SUM(pit03) FROM Invoices WHERE MONTH(transactionDate)=%s AND YEAR(transactionDate)=%s";
    #try:
    cursor.execute(sqlQuery,(req.month,req.year))
    rows = cursor.fetchall()
    if len(rows) > 0:
        total = sum(rows[0],len(rows[0]))
        result = dict()
        result["total"] = total;
        result["totals"] = rows[0]
        percentages = [i*100/total for i in rows[0][:-1]]
        healthcare = [800 * (f/100) for f in percentages]
        result["percentages"] = [round(f,2) for f in percentages]
        result["healthcare"] = [round(f,2) for f in healthcare]
        return {"summary":result}
    #except Exception as e:
    #return {"summary":[],"error":"failed to connect to db"}
    return {"summary":[],"error":"no records found"} 

class CsvReq(BaseModel):
    token: str

    month: str
    year: str

@app.post("/csvgenerator")
def get_csv(req: CsvReq):
    userId = getUserFromToken(req.token)
    if userId == -1:
        return {"status":1,"desc":"permission denied"}
    db = getDb()
    cursor = db.cursor()
    fields = ["contractorType","contractorNip","idCardNumber","transactionDate","registrationDate","pit17","pit15","pit12","pit10","pit85","pit55","pit03","notes"]
    sqlQuery = "SELECT " + ",".join(fields) + " FROM Invoices WHERE MONTH(transactionDate)=%s AND YEAR(transactionDate)=%s"
    cursor.execute(sqlQuery,(req.month,req.year))
    rows = cursor.fetchall()
    result = ""
    for row in rows:
        for val in row:
            if val== None:
                result += "brak , "
            else:
                result += str(val) + ", "
        result = result[:-2]
        result += '\n'
    return {"status":0,"csvfile":result}

class CsvLoadReq(BaseModel):
    token: str
    content: str

@app.post('/csvloader')
def load_csv(req: CsvLoadReq):
    userId = getUserFromToken(req.token)
    if userId == -1:
        return {"status" : 1,"desc":"permission denied"}
    rows = req.content.split('\n')
    data = []
    for row in rows:
        data.append(row.split(","))
        for i in range(0,len(data[-1])):
            data[-1][i] = data[-1][i].strip()
    db = getDb()
    cursor = db.cursor()
    fields = ["contractorType","contractorNip","idCardNumber","transactionDate","registrationDate","pit17","pit15","pit12","pit10","pit85","pit55","pit03","notes"]
    sqlRequest = "INSERT INTO Invoices " + ",".join(fields) + " values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    try:
        for x in data:
            cursor.execute(sqlRequest,(tuple(x)))
    except Exception as e:
        return {"status":1,"desc":"Failed to insert some items"}
    return {"status":0}
        
