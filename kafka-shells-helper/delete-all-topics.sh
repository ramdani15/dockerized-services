#!/bin/bash

BROKER_ADDRESS="localhost:9092"

# Get all topic names
topics=$(docker compose exec kafka /opt/kafka/bin/kafka-topics.sh --list --zookeeper zookeeper)

# Confirm to delete all topics
echo "Are you sure you want to delete all topics? (yes/no)"
read confirm
if [ "$confirm" != "yes" ]
then
  echo "Aborted"
  exit 1
fi

# Delete each topic
for topic in $topics
do
  echo "Deleting topic: $topic"
  docker compose exec kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server $BROKER_ADDRESS --delete --topic $topic
done
