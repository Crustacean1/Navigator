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
    allow_methods=[""],
    allow_headers=[""],
)
class LoginData(BaseModel):
    login: str
    password: str

class TokenData(BaseModel):
    token: str

class TableRequest(BaseModel):
    month: str
    year: str

def getUserFromToken(token: str):
    session = mysql.connector.connect(
        host="localhost",
        port=3307,
        database="Navigator",
        user="root",
        password="plsnohack"
    )
    cursor = session.cursor()
    sqlQuery = "SELECT userId FROM Sessions WHERE token='dasfadsf'"#" AND timestampdiff(HOUR,Sessions.loginDate,NOW())<2"
    cursor.execute(sqlQuery)#,("jpadfsasd"))
    rows = cursor.fetchall()
    if len(rows)==1:
        return rows[0][0] 
    return -1


@app.get("/")
def hello_world():
    return {"woo": "foo"}

@app.get("/verification")
def verify_user(loginData: LoginData):
    """ function to obtain token lasting 1h, authenticating user to access his data """
    session = mysql.connector.connect(
        host="localhost",
        port=3307,
        database="Navigator",
        user="root",
        password="plsnohack"
    )
    
    cursor = session.cursor()
    sqlQuery = "SELECT id FROM Users where password=%s and login=%s"
    cursor.execute(sqlQuery,(loginData.password,loginData.login))
    rows = cursor.fetchall()

    if len(rows) > 0:
        randomToken = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(64))
        sqlQuery = "INSERT INTO Sessions (userId,loginDate,token,active) values (%s,NOW(),%s,TRUE)"
        cursor.execute(sqlQuery,(rows[0][0],randomToken))
        session.commit()
        session.close()
        return {"login_status":"success","token":randomToken,"userId":rows[0][0]}

    return {"login_status": "permission denied"}

@app.get("/monthlyreport")
def get_monthly_report(tok: TokenData):
    """ function to retrieve tables"""
    userId = getUserFromToken(tok.token)
    if userId == -1:
        return {"data":"reeeeee, get away from my data"}
    return {"data":"here you go kind sir"}


