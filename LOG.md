# Prologue
- I tried to understand the problem by reading the description throughtfully.
- To have better understanding, I tried to draw the system at the high level.
- By drawing it I got more understanding regarding the input and output for each modules.
- Having a quick understanding for each modules I decide to start with Module 1 (Ingestion).
- Since the system expected to ingest data from multiple sources, We'll need to create one single source of truth for the data itself. It can be achieved by creating a database endpoint that can be accessed by multiple process.

- The candidate for databases are: Dynamodb and RDS
- Decide to pick RDS since SQL should be future proof for the system.

# Start working on the terraform module for RDS
