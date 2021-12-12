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
    sqlQuery = "SELECT userId FROM Sessions WHERE token=%s AND timestampdiff(HOUR,Sessions.loginDate,NOW())<2 AND active=1"
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
        sqlQuery = "UPDATE Sessions SET active=0 WHERE userId = %s AND timestampdiff(HOUR,Sessions.loginDate,NOW())<2"
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
    brakcets = ["17","15","12.5","10","8.5","5.5","3"]
    sqlQuery = "SELECT "+ ",".join(fields) + " FROM Invoices WHERE userId=%s"
    cursor.execute(sqlQuery,(userId,))
    rows = cursor.fetchall()
    result = []
    for row in rows:
        i = 0
        result.append(dict())
        for val in row:
            result[-1][fields[i]] = val
            i+=1
    return {"userId": userId,"table":result}
