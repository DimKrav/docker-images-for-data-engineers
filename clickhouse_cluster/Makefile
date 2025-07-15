up:
	docker compose up -d --remove-orphans

down:
	docker compose down

client0101:
	docker exec -it clickhouse-01-01 clickhouse client --multiquery --multiline

client0102:
	docker exec -it clickhouse-01-02 clickhouse client --multiquery --multiline

client0201:
	docker exec -it clickhouse-02-01 clickhouse client --multiquery --multiline

client0202:
	docker exec -it clickhouse-02-02 clickhouse client --multiquery --multiline