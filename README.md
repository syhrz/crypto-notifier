# Crypto Watch

A serverless crypto notification system. This system breaks down into 3 parts:
- Ingestion
- Analysis
- Notification

All modules is designed to run on AWS. The architecture can be shown below.

<img alt="architecture" src="https://s15.postimg.cc/v2gp96hez/cypto-notifier-arch.png" width="600px">

## Ingestion
The ingestion module is responsible to get the date from various resources. This module mainly implemented with AWS Lambda. The lambda scripts have responsibilities to read the data from the source and write it to the PostgreSQL database that running on RDS.

## Analysis
The analysis module is responsible to do quick analysis from the data that already gathered. Analysis module will run periodically using Lambda with cloudwatch.

## Notification
The notification module is responsible to inform the user regarding the changes based on the analysis module. This module is using the combination of SQS and SNS to sent email to users.

# Room for Improvement
There are a few (not limited) aspects of improvement that can be appliead to the architecture, such as:
- Using multi AZ for RDS in ingestion module.
- Using read replica for data that read by Analysis module.
