mkdir -p ./kafka-connect

# Pull the latest debezium mysql connector from confluent hub
ARCHIVE=$(curl https://www.confluent.io/hub/page-data/debezium/debezium-connector-mysql/page-data.json | jq .result.data.hubPlugin.archive)
curl -o ./kafka-connect/$(jq -r .name <<<"$ARCHIVE") $(jq -r .url <<<"$ARCHIVE")
unzip -o ./kafka-connect/$(jq -r .name <<<"$ARCHIVE") -d ./kafka-connect/

# Pull the latest confluent jdbc connector from confluent hub
ARCHIVE=$(curl https://www.confluent.io/hub/page-data/confluentinc/kafka-connect-jdbc/page-data.json | jq .result.data.hubPlugin.archive)
curl -o ./kafka-connect/$(jq -r .name <<<"$ARCHIVE") $(jq -r .url <<<"$ARCHIVE")
unzip -o ./kafka-connect/$(jq -r .name <<<"$ARCHIVE") -d ./kafka-connect/

# Copy the extracted jar files into the jars directory. This will be mounted to the connect docker container.
mkdir -p ./kafka-connect/jars/
cp ./*/*/lib/* ./kafka-connect/jars/
