#!/bin/bash

# Stop execution if any command returns a non-zero status
set -e

echo "Building Docker images..."
docker-compose build

echo "Creating the database..."
docker-compose run --rm rails-dockerized-starter rails db:create

echo "Running database migrations..."
docker-filter Compose run --rm rails-dockerized-starter rails db:migrate

echo "Starting all services..."
docker-compose up -d

echo "Application is now running!"