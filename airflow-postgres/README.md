# Airflow + PostgreSQL Docker Image

## Overview
This directory contains a Docker setup for running **Apache Airflow** with **PostgreSQL** as the metadata database and a separate **independent** PostgreSQL service as the data warehouse (DWH). 

## Features
- **Apache Airflow** (configured as LocalExecutor)
- **PostgreSQL** (as the Airflow metadata database)
- **Data warehouse (DWH) as an independent PostgreSQL service**
- **Init DDL script for DWH schema**
- **A pre-configured Airflow connection allows DAGs to interact with the data warehouse (DWH) using a PostgresHook**


## Installation & Setup
1. Clone this repository:
   ```sh
   git clone https://github.com/DimKrav/docker-images-for-data-engineers.git
   cd docker-images-for-data-engineers/airflow-postgres
   ```

2. Create the necessary directories and environment files:
   ```sh
   mkdir -p ./dags ./logs ./plugins ./sql
   cp .env.example .env
   echo -e "AIRFLOW_UID=$(id -u)" >> .env
   ```
   - `.env.example` contains a template for environment variables. Copy it to `.env` and modify it if necessary.

3. Initialize the Airflow database:
   ```sh
   docker-compose up airflow-init
   ```

4. Start the Airflow and PostgreSQL services:
   ```sh
   docker-compose up -d
   ```

5. Access the Airflow Web UI:
   - Open your browser and go to: [http://localhost:8080](http://localhost:8080)
   - Default credentials:
     - **Username:** airflow
     - **Password:** airflow

6. Access the DWH
   - Host: http://localhost:5432
   - Database: `dwh_db`
   - Default credentials:
     - **Username:** postgres
     - **Password:** postgres


## Directory Structure
```
airflow-postgres/
│── dags/          # Your DAG scripts
│── logs/          # Airflow logs
│── plugins/       # Custom plugins
│── sql/           # Init DDL script for DWH
│── docker-compose.yml
│── .env.example   # Environment variable template
│── .env           # User-defined environment variables
│── README.md
```

## DAGs Writing
To use the PostgresHook, add this code to your DAG:
   ```python
   from airflow.providers.postgres.hooks.postgres import PostgresHook

   def get_postgres_hook():
      hook = PostgresHook(postgres_conn_id='dwh_connection')
      return hook
   ```
Note: Connections configured via environment variables are not shown in the Airflow UI due to security constraints.


## Stopping & Removing Containers
To stop the running containers:
```sh
docker-compose down
```
To remove all data and reset the environment:
```sh
docker-compose down --volumes --remove-orphans
```


---
### Author
Maintained by **[DimKrav](https://github.com/DimKrav)**

