from flask import Flask, render_template, url_for, request, jsonify, redirect, url_for, session
from flask_mysqldb import MySQL

app = Flask(__name__)

@app.route('/', methods=["GET"])
def home():
    return 'hello'

if __name__ == "__main__":
    app.run(debug=True)