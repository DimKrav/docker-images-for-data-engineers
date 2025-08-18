# ClickHouse Cluster on ClickHouse Keeper

### Start the Cluster

To start the cluster, run the following command:

```bash
make config up
```

This will start the ClickHouse server and zookeeper container named `company_cluster`.

### Access ClickHouse Client

The ClickHouse cluster is in `172.23.0.0/24` network.

| **Container** | **Address** |
|---------------|-------------|
| zookeeper     | 172.23.0.10 |
| clickhouse01  | 172.23.0.11 |
| clickhouse02  | 172.23.0.12 |
| clickhouse03  | 172.23.0.13 |
| clickhouse04  | 172.23.0.14 |


### Users
- default - no password
- admin - password 123

### Stop and Start the Cluster

To stop the cluster, run the following command:

```bash
make start
make stop
```

### Down the Cluster

To stop the cluster, run the following command:

```bash
make down
```
