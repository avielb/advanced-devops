# make sure to work with a github repo before class in pycharm
mkdir .github/workflows
cd .github/workflows
create a file: 01-example.yaml
---
name: Run Tests

on:
  push:
    branches:
        - main
    pull_request:
      branches:
        - main
  workflow_dispatch:

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: show files
        run: |
          ls -ltr

----
https://github.com/avielb/advanced-devops/blob/master/.github/workflows/seq-and-para.yaml
https://github.com/avielb/advanced-devops/blob/master/.github/workflows/matrix.yaml

https://github.com/avielb/advanced-devops/settings/secrets/actions





under the main git repo folder 
create file test_example.py

add the following content:

def test_one_equals_one():
    assert 1 == 1


add requirements.txt and write:
flask
pytest



name: Deploy to Production
#####################
# create secrets before running this
#####################
on:
  push:
    branches:
      - main
      - master

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Deploy to Server
        run: |
          echo "secret string is: ${{ secrets.SECRET_STRING }}"

PR 
---
https://github.com/avielb/advanced-devops/blob/f80777bd5164728f1e945b523e72aceddb2fca04/.github/workflows/pr-comment.yaml








from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from GitHub Actions + Docker!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

