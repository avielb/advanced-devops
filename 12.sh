.gitignore


.idea/**
.venv/**
https://github.com/new
https://github.com/settings/tokens/new
* * * * *
.github/workflows/first.yaml



name: List Files on Main Commit

on:
  push:
    branches:
      - main

jobs:
  list-files:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Run ls -l
      run: ls -l
