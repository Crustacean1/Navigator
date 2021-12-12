<<<<<<< HEAD
from fastapi import FastAPI, Response, Cookie, Request
from pydantic import BaseModel
from typing import Optional
import mysql.connector
import random
import string
=======
from fastapi import FastAPI
from database import mydb
>>>>>>> origin/master

app = FastAPI()

class LoginData(BaseModel):
    login: str
    password: str

@app.get("/")
def hello_world():
    return {"woo": "foo"}

@app.get("/verification")
def verify_user(loginData: LoginData,response: Response):
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
@app.get("/user_profile")

def display_profile(request: Request, user_login: Optional[str] = Cookie(None)):
    if user_login:
        return {"user_password":user_login}
    return {"user_login":"None :("}


