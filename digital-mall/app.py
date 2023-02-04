from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:12663503@localhost/mydb'
db = SQLAlchemy(app)


@app.route('/hello', methods=['GET'])
def index():
    print(db.metadata)
    return 'hi'


if __name__ == "__main__":
    app.run(debug=True)