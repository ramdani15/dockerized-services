#!/bin/bash

BROKER_ADDRESS="localhost:9092"

# Get topics from the input
topics=$@

# Check if there are no topics
if [ -z "$topics" ]
then
  echo "No topics provided"
  exit 1
fi

# Remove each topic
for topic in $topics
do
  echo "Removing topic: $topic"
  docker compose exec kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server $BROKER_ADDRESS --delete --topic $topic
done