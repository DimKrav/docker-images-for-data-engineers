# ClickHouse Cluster on ClickHouse Keeper

### Start the Cluster

To start the cluster, run the following command:

```bash
make up
```

This will start the ClickHouse server and keeper containers.
The containers will be named `clickhouse-<shard-id>-<replica-id>` and `clickhouse-keeper-<id>`.

### Access ClickHouse Client

To access the ClickHouse client, you can run the following command:

```bash
make client0101
```

This will open a bash terminal in the container for the first ClickHouse server (`clickhouse-01-01`), allowing you to execute SQL queries against the cluster.

### Stop the Cluster

To stop the cluster, run the following command:

```bash
make down
```
