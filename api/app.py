from fastapi import FastAPI, Response, Cookie, Request
from pydantic import BaseModel
from typing import Optional
import mysql.connector

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
        database="Navigator",
        user="root",
        password="root"
    )
    cursor = session.cursor()
    sqlQuery = "SELECT COUNT(id) FROM Users WHERE password=%s AND login=%s"
    cursor.execute(sqlQuery,(loginData.password,loginData.login))
    rows = cursor.fetchAll()
    if len(rows) > 0:
        return {"login_status":"success"}
    return {"login_status": "It's true"}
@app.get("/user_profile")

def display_profile(request: Request, user_login: Optional[str] = Cookie(None)):
    if user_login:
        return {"user_password":user_login}
    return {"user_login":"None :("}


