# Apache Spark 3.5.0 + JupyterLab in Docker

Local Apache Spark 3.5.0 cluster (1 master + 2 workers) with a JupyterLab interface.

## Stack

- **Apache Spark 3.5.0** (Bitnami images)
  - 1 Spark Master
  - 2 Spark Workers
- **JupyterLab** (based on `jupyter/pyspark-notebook:spark-3.5.0`)
- Shared `data/` and `notebooks/` volumes across all services

## Project Structure

```bash
docker-images-for-data-engineers/
├── data/                  # Shared datasets used by Spark and Jupyter
├── notebooks/             # Jupyter notebooks will be saved here
├── docker-compose.yml     # Main Docker Compose config
└── README.md              # This file
```

## Getting Started
1. Clone this repo:
```bash
git clone https://github.com/your-user/docker-images-for-data-engineers.git
cd docker-images-for-data-engineers
```

2. Start the cluster:

```bash
docker-compose up -d
```

3. Access interfaces:

- JupyterLab: http://localhost:8888
   - Token/password: password
- Spark Master UI: http://localhost:8080
- Spark Worker 1 UI: http://localhost:8081
- Spark Worker 1 UI: http://localhost:8082

4. Login to JupyterLab and start coding!

Example PySpark snippet:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.master("spark://spark-master:7077").getOrCreate()
df = spark.read.csv("/data/your-file.csv", header=True, inferSchema=True)
df.show()
```


## Data Sharing
All services share the `./data` folder via Docker volumes. Place your `CSV`, `JSON`, or `Parquet` files there and access them in Jupyter or Spark directly via `/data`.

## Tear Down
```bash
docker-compose down -v
```
This will stop containers and remove volumes.