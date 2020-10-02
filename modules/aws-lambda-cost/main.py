import datetime
import json
import logging
import os

import boto3
import urllib3

logger = logging.getLogger()
logger.setLevel(logging.INFO)

SLACK_CHANNEL_NAME = os.environ["SLACK_CHANNEL_NAME"]
SLACK_POST_URL = os.environ["SLACK_POST_URL"]

response = boto3.client("cloudwatch", region_name="us-east-1")

get_metric_statistics = response.get_metric_statistics(
    Namespace="AWS/Billing",
    MetricName="EstimatedCharges",
    Dimensions=[{"Name": "Currency", "Value": "USD"}],
    StartTime=datetime.datetime.today() - datetime.timedelta(days=1),
    EndTime=datetime.datetime.today(),
    Period=86400,
    Statistics=["Maximum"],
)

cost = get_metric_statistics["Datapoints"][0]["Maximum"]
date = get_metric_statistics["Datapoints"][0]["Timestamp"].strftime("%Y/%m/%d")
time = get_metric_statistics["Datapoints"][0]["Timestamp"].strftime("%H:%M:%S")


def build_message(cost):
    if float(cost) >= 30.0:
        color = "#ff0000"
    elif float(cost) > 5.0:
        color = "warning"
    else:
        color = "good"

    text = "Date: %s\nTime: %s\nCost: $%s" % (date, time, cost)

    atachements = {"text": text, "color": color}
    return atachements


def lambda_handler(event, context):
    content = build_message(cost)

    slack_message = {
        "channel": SLACK_CHANNEL_NAME,
        "attachments": [content],
    }

    try:
        http = urllib3.PoolManager()
        http.request(
            "POST",
            SLACK_POST_URL,
            headers={"Content-Type": "application/json"},
            body=json.dumps(slack_message),
        )
        logger.info("Message posted to %s", SLACK_CHANNEL_NAME)
    except Exception as e:
        logger.error("Failed: %s", e)
