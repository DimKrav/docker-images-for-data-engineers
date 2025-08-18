# ClickHouse Cluster on Zookeeper

### Start the Cluster

To start the cluster, run the following command:

```bash
make config up
```
This will start the ClickHouse servers and the Zookeeper container defined as `company_cluster`.

### Access ClickHouse Client
The ClickHouse cluster is deployed in the `172.23.0.0/24` network.

| **Container** | **Address** |
|---------------|-------------|
| zookeeper     | 172.23.0.10 |
| clickhouse01  | 172.23.0.11 |
| clickhouse02  | 172.23.0.12 |
| clickhouse03  | 172.23.0.13 |
| clickhouse04  | 172.23.0.14 |


### ClickHouse Cluster Topology

The ClickHouse cluster consists of **two shards**, each with **two replicas**:

| Shard | Replica | Hostname     |
|-------|---------|--------------|
| 1     | 1       | clickhouse01 |
| 1     | 2       | clickhouse02 |
| 2     | 1       | clickhouse03 |
| 2     | 2       | clickhouse04 |

This topology provides replication and high availability within each shard.


### Users
- default - no password
- admin - password 123


### Connect via DBeaver

1. Open **DBeaver** → click **New Database Connection**  
2. Select **ClickHouse** from the list of drivers (install the driver if needed).  
3. Fill in the connection settings:
   - **Host:** `172.23.0.11` (or any ClickHouse node, e.g. `172.23.0.12`)  
   - **Port:** `8123` (HTTP interface)  
   - **Database:** `default`  
   - **User:** `default` (or `admin`)  
   - **Password:** leave empty for `default`, or `123` for `admin`  

4. Test the connection and click **Finish**.  



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


