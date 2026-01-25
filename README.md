# About
This is a simple project created to learn Terraform and AWS LocalStack with Lambda functions. I also set up the configuration to work with multiple Lambdas inside a single repository in VS Code.

It's necessary to run:
- Docker;
- AWS LocalStack Image;
- Terraform;
- Terraform Local;
- Python 3.12


## Lambda build
```
rm -rf build lambda.zip
mkdir -p build
uv export --format requirements-txt --no-dev --output-file build/requirements.txt
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r build/requirements.txt -t build/
cp main.py build/
(cd build && zip -r ../lambda.zip .)
```

### Install lambda to run with uv
```
uv venv .venv
uv sync
```


## Terraform
```
tflocal init
tflocal validate
tflocal plan
tflocal apply
```


## Invoke lambda
```
aws --endpoint-url=http://localhost:4566 lambda invoke \
  --function-name test_lambda \
  --payload '{"hello":"world", "data": "my_first_localstack_lambda"}' \
  response.json \
  --cli-binary-format raw-in-base64-out \
  --region us-east-1
```


