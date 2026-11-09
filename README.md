
# dockerized-services

## Overview
**dockerized-services** is a one-stop solution for running a wide range of services in a Docker environment. This repository includes popular databases, caching systems, and management tools, all containerized for easy deployment and management. It's designed to be a flexible, all-in-one environment that can be extended with additional services as your needs grow.

## Included Services
- **MySQL**: Relational database management system.
- **phpMyAdmin**: Web interface for managing MySQL databases.
- **PostgreSQL**: Advanced open-source relational database.
- **PostGIS**: PostgreSQL 16 with the PostGIS 3.4 spatial extension, running as a separate instance.
- **pgAdmin**: Web interface for managing PostgreSQL databases.
- **MongoDB**: NoSQL document database.
- **MongoExpress**: Web interface for managing Mongo databases.
- **Redis**: In-memory data structure store, used as a database, cache, and message broker.
- **Memcached**: High-performance, distributed memory object caching system.
- **Kafka**: Distributed event-streaming platform designed for handling real-time data feeds.
- **Elasticsearch**: (Planned) Distributed search and analytics engine.

## Getting Started

### Prerequisites
- [Docker](https://www.docker.com/get-started) installed on your system.
- [Docker Compose](https://docs.docker.com/compose/install/) installed.
- [Make](https://www.gnu.org/software/make/#download) installed

### Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/ramdani15/dockerized-services.git
   cd dockerized-services
   ```

2. **Setup config**
    ```bash
    cp .env.example .env
    ```

3. **Start the services:**

    a. MySQL
    ```bash
    make build_mysql
    ```

    b. PostgreSQL
    ```bash
    make build_postgres
    ```

    c. PostGIS
    ```bash
    make build_postgis
    ```

    d. Mongo
    ```bash
    make build_mongo
    ```

    e. Redis
    ```bash
    make build_redis
    ```

    f. Memcached
    ```bash
    make build_memcached
    ```

    g. Kafka
    ```bash
    make build_kafka
    ```

    h. All
    ```bash
    make build
    ```

3. **Access the services:**
   - MySQL: `localhost:3306`
   - phpMyAdmin: `http://localhost:8082`
   - PostgreSQL: `localhost:5432`
   - PostGIS: `localhost:5433`
   - pgAdmin: `http://localhost:82`
   - MongoDB: `localhost:27017`
   - MongoExpress: `http://localhost:8081`
   - Redis: `localhost:6379`
   - Memcached: `localhost:11211`
   - Kafka: `localhost:9092`

4. **Stop the services:**

    a. MySQL
    ```bash
    make down_mysql
    ```

    b. PostgreSQL
    ```bash
    make down_postgres
    ```

    c. PostGIS
    ```bash
    make down_postgis
    ```

    d. Mongo
    ```bash
    make down_mongo
    ```

    e. Redis
    ```bash
    make down_redis
    ```

    f. Memcached
    ```bash
    make down_memcached
    ```

    g. Kafka
    ```bash
    make down_kafka
    ```

    h. All
    ```bash
    make down
    ```

### Configuration
- You can customize the configuration of each service by editing the `.env` file or directly modifying the `docker-compose.yml` file.

### PostGIS
- PostGIS runs as its own PostgreSQL 16 instance with its own data directory (`data/postgis_data`) and credentials (`POSTGIS_*` in `.env`), so it does not touch the existing PostgreSQL 14 data.
- The PostGIS extension is enabled automatically in `POSTGIS_DB` and in the `template_postgis` database. For any other database, run `CREATE EXTENSION postgis;`, or create it from the template: `CREATE DATABASE my_geo_db TEMPLATE template_postgis;`.
- To manage it from pgAdmin, register a new server with host `postgis`, port `5432` (the port inside the Docker network, not the published one), and the `POSTGIS_USER` / `POSTGIS_PASSWORD` credentials.

### Adding New Services
To add new services, simply:
1. Add the necessary service configuration to the `docker-compose.yml` file.
2. Add the make command in `Makefile`.
3. Build and start the services again using registered command in `Makefile`.

## Contributing
Feel free to contribute by opening issues or submitting pull requests. Contributions are welcome, whether it's for bug fixes, new features, or additional services.

## Contact
For any inquiries, please contact [ramdaninformatika@gmail.com](mailto:ramdaninformatika@gmail.com).
