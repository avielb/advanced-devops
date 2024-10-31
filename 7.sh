from flask import Flask, render_template, jsonify

app = Flask(__name__)
data = [
    {"id": 1, "name": "Alice"},
    {"id": 2, "name": "Bob"},
]
@app.route('/')
def home():
    return "Hello, World!"

@app.route('/names')
def names():
    return jsonify(data)
app.run()


import requests
response = requests.get("http://127.0.0.1:5000/names")
result = response.json()
expected = "Alice1"
actual = result[0]["name"]
assert actual == expected


docker run -d --name my-jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
