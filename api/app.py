from fastapi import FastAPI
from database import mydb

app = FastAPI()

@app.get("/")
def hello_world():
    return {"woo": "foo"}


