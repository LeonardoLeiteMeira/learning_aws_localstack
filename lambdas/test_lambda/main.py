import json
import os
import boto3

def lambda_handler(event, context):
    # Simulando configs (ex: URL de banco / feature flags / etc.)
    boto = boto3
    print(str(boto))
    db_url = os.getenv("DB_URL", "NOT_SET")
    feature_flag = os.getenv("FEATURE_FLAG_X", "false")

    print("[lambda] event:", json.dumps(event))
    print("[lambda] DB_URL:", db_url)
    print("[lambda] FEATURE_FLAG_X:", feature_flag)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "ok": True,
            "db_url_is_set": db_url != "NOT_SET",
            "feature_flag_x": feature_flag
        })
    }