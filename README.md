# Crypto Watch

A serverless crypto notification system. This system breaks down into 3 parts:
- Ingestion
- Analysis
- Notification

All modules is designed to run on AWS. The architecture can be shown below.

<img alt="architecture" src="https://s15.postimg.cc/v2gp96hez/cypto-notifier-arch.png" width="600px">

## Ingestion
The ingestion module is responsible to get the date from various resources. This module mainly implemented with AWS Lambda. The lambda scripts have responsibilities to read the data from the source and write it to the PostgreSQL database that running on RDS.

There are some reasoning of using lambda:
Lambda offer flexibility for scaling the number of data sources. We can create multiple lambda modules that can handle different resources.

In the initial design We'll only use one RDS. We can improve the design of the database to be more fault tolerant by implementing Multi-AZ and create the read replica for analysis module.

[![ingestion-module.png](https://s33.postimg.cc/brhu75h33/ingestion-module.png)](https://postimg.cc/image/kmioho5vf/)

## Analysis
The analysis module is responsible to do quick analysis from the data that already gathered. For the initial design analysis module will run periodically using Lambda with cloudwatch. When things getting heavy We can improve the design by using EC2 with autoscaling group to run heavy analysis or ECS. For bigger scale analysis I'd stick with using EC2 with autoscaling since using ECS (container) won't benefit much and AWS services / technology stack is not (yet) docker friendly.

## Notification
The notification module is responsible to inform the user regarding the changes based on the analysis module. This module is using the combination of SQS and SNS to sent email to users.

# Room for Improvement
There are a few (not limited) aspects of improvement that can be appliead to the architecture, such as:
- Using multi AZ for RDS in ingestion module.
- Using read replica for data that read by Analysis module.
