# About
This is a simple project created to learn Terraform and AWS LocalStack with Lambda functions. I also set up the configuration to work with multiple Lambdas inside a single repository in VS Code.


## Lambda build

```
rm -rf build lambda.zip
mkdir -p build
uv export --format requirements-txt --no-dev --output-file build/requirements.txt
python -m pip install -r build/requirements.txt -t build/
cp app/lambda_function.py build/
(cd build && zip -r ../lambda.zip .)
```


## Terraform
```
cd terraform/LAMBDA_NAME
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


