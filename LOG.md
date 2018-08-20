# Prologue
- I tried to understand the problem by reading the description throughtfully.
- To have better understanding, I tried to draw the system at the high level.
- By drawing it I got more understanding regarding the input and output for each modules.
- Having a quick understanding for each modules I decide to start with Module 1 (Ingestion).
- Since the system expected to ingest data from multiple sources, We'll need to create one single source of truth for the data itself. It can be achieved by creating a database endpoint that can be accessed by multiple process.

- The candidate for databases are: Dynamodb and RDS
- Decide to pick RDS since SQL should be future proof for the system.

# Start working on the terraform module for RDS

Create tf-simple-rds module
Some RDS related resources created manually / preconfigured such as:
- db-subnet-group
- RDSMonitoring Role
- Default VPC

Successfully provisioned the RDS using the terraform module.
Just realized SSH is blocked from my home. I'll figure it later how to initialize the database schema.

# Start working on the Lambda script to fetch the data from S3 and store it to RDS
I naively pick the language that I'm not familiar: Go.
Finally made the lambda get the data from S3, parse it and store in variable.
Still missing the write function to database (RDS postgres)

# Back to the documentation
Update the README.md to give more general picture of the architecture
I think I've passed the 12 hour mark. So finger cross and let's see.
