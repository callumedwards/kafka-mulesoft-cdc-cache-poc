## Setup
run `setup.sh`
This downloads the latest debezium mysql connector and jdbc sink connector from confluent hub and extracts the jars to a directory that is mounted to the kafka connect docker container

## Start Docker Containers
run `docker-compose up -d`

## Create the cdc connector
run
`curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d @./inventory-connector.json`

## Create the sink connector
run
`curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d @./inventory-customer-read-only-sink-connector.json`
