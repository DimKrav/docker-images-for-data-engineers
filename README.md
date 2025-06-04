## Overview
This repository contains useful Docker-based setups designed for data engineers. Each directory includes a Dockerized environment.

## Available Images
### 1. [Airflow + PostgreSQL](./airflow-postgres/README.md)
A pre-configured environment for Apache Airflow (Local Executor) with PostgreSQL as both the metadata database and an independent data warehouse (DWH).

**Technologies:** Apache Airflow, PostgreSQL, Docker Compose

### 2. [Hadoop on Local Machine](./docker-hadoop/README.md) 
This docker-compose file is taken from the repository [big-data-europe/docker-hadoop](https://github.com/big-data-europe/docker-hadoop)

### 3. [Clickhouse](./clickhouse/README.md)
Clickhouse

### 4. [PostgreSQL](./postgres/README.md)
Postgres SQL server 

### 5. [PostgreSQL + pgAdmin4](./postgres-pgadmin/docker-compose.yaml)

### 6. [Apache Spark + JupyterLab](./spark-jupyter/README.md)
Local Apache Spark 3.5.0 cluster (1 master + 2 workers) with a JupyterLab interface.