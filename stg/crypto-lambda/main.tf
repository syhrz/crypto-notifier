terraform {
  backend "s3" {
    bucket = "crypto-tf-state-stg"
    key    = "crypto-lambda"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_role" "iam_lambda" {
  name = "CryptoLambdaRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "main" {
  filename         = "main.zip"
  function_name    = "crypto-lambda"
  role             = "${aws_iam_role.iam_lambda.arn}"
  handler          = "main"
  source_code_hash = "${base64sha256(file("main.zip"))}"
  runtime          = "go1.x"

  environment {
    variables = {
      Environment = "stg"
    }
  }
}
