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
