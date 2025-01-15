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

# Create each topic
for topic in $topics
do
  echo "Creating topic: $topic"
  docker compose exec kafka /opt/kafka/bin/kafka-topics.sh --create --topic $topic --bootstrap-server $BROKER_ADDRESS
done