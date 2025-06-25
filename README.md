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

### 5. [PostgreSQL + pgAdmin4](./postgres-pgadmin/README.md)

### 6. [Apache Spark + JupyterLab](./spark-jupyter/README.md)
Local Apache Spark 3.5.0 cluster (1 master + 2 workers) with a JupyterLab interface.

### 7. [Apache Superset](./superset/README.md)
The repository is taken from [https://github.com/apache/superset](https://github.com/apache/superset)

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/apache/superset.git
    cd superset
    ```

2. **Start Superset Using Docker Compose**
The first startup may take 5–10 minutes:
    ```bash
    docker-compose -f docker-compose-non-dev.yml up
    ```

3 **Access the Superset Web UI**
- **URL:** [http://localhost:8088/](http://localhost:8088/)
- **Username:** `admin`
- **Password:** `admin`

### 8. [Apache Airflow - DWH- Apache Superset](./airflow-postgres-superset/README.md)
The repository is a combination of
1. [Airflow + PostgreSQL](./airflow-postgres/README.md)
7. [Apache Superset](./superset/README.md)