from flask import Flask
from scrap.scrap import scrap
app = Flask(__name__)

@app.route('/api/v1/')
def overview():
    return scrap().overview()

@app.route('/api/v1/receipes/')
def recipes():
    return scrap().recipes()

@app.route('/api/v1/articles/')
def articles():
    return scrap().articles()

if __name__ == "__main__":
    app.run(debug=True)