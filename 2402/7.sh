# make sure to work with a github repo before class in pycharm
mkdir .github/workflows
cd .github/workflows
create a file: 01-example.yaml
---
name: Run Tests

on:
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

