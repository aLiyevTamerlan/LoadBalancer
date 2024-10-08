import os
from fastapi import FastAPI

app = FastAPI(debug=True)
@app.router.get("/")
def get_app_name():
    app_name = os.getenv("app_name")
    return {"name": app_name}