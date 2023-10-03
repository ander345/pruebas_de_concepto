network:
	docker network create -d bridge blknet
zookeeper:
	docker run -d --name=zookeeper -p 2181:2181 --network=blknet \
		-e ZOOKEEPER_CLIENT_PORT=2181 \
		-e ZOOKEEPER_TICK_TIME=2000 \
		-e ZOOKEEPER_SYNC_LIMIT=2 \
		ghcr.io/arm64-compat/confluentinc/cp-zookeeper:7.1.1
kafka:
	docker run -d --name=kafka -p 9092:9092 --network=blknet \
		-e KAFKA_BROKER_ID=1 \
		-e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
		-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
		-e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
		-e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
		ghcr.io/arm64-compat/confluentinc/cp-kafka:7.1.1