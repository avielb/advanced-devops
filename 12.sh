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
_________________________________________




name: Run on Pull Request

on:
  pull_request:
    branches:
      - main  # Trigger the action only for PRs targeting the main branch

jobs:
  list-files:
    runs-on: ubuntu-latest  # Run on the latest Ubuntu environment

    steps:
    - name: Checkout code
      uses: actions/checkout@v3  # Checkout the pull request code

    - name: Run ls -l
      run: ls -l  # List the files in the current directory
