
# dockerized-services

## Overview
**dockerized-services** is a one-stop solution for running a wide range of services in a Docker environment. This repository includes popular databases, caching systems, and management tools, all containerized for easy deployment and management. It's designed to be a flexible, all-in-one environment that can be extended with additional services as your needs grow.

## Included Services
- **MySQL**: Relational database management system.
- **phpMyAdmin**: Web interface for managing MySQL databases.
- **PostgreSQL**: Advanced open-source relational database.
- **pgAdmin**: Web interface for managing PostgreSQL databases.
- **MongoDB**: NoSQL document database.
- **MongoExpress**: Web interface for managing Mongo databases.
- **Redis**: In-memory data structure store, used as a database, cache, and message broker.
- **Memcached**: High-performance, distributed memory object caching system.
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

    c. Mongo
    ```bash
    make build_mongo
    ```

    d. Redis
    ```bash
    make build_redis
    ```

    e. Memcached
    ```bash
    make build_memcached
    ```

    f. All
    ```bash
    make build
    ```

3. **Access the services:**
   - MySQL: `localhost:3306`
   - phpMyAdmin: `http://localhost:8082`
   - PostgreSQL: `localhost:5432`
   - pgAdmin: `http://localhost:82`
   - MongoDB: `localhost:27017`
   - MongoExpress: `http://localhost:8081`
   - Redis: `localhost:6379`
   - Memcached: `localhost:11211`

4. **Stop the services:**

    a. MySQL
    ```bash
    make down_mysql
    ```

    b. PostgreSQL
    ```bash
    make down_postgres
    ```

    c. Mongo
    ```bash
    make down_mongo
    ```

    d. Redis
    ```bash
    make down_redis
    ```

    e. Memcached
    ```bash
    make down_memcached
    ```

    f. All
    ```bash
    make down
    ```

### Configuration
- You can customize the configuration of each service by editing the `.env` file or directly modifying the `docker-compose.yml` file.

### Adding New Services
To add new services, simply:
1. Add the necessary service configuration to the `docker-compose.yml` file.
2. Add the make command in `Makefile`.
3. Build and start the services again using registered command in `Makefile`.

## Contributing
Feel free to contribute by opening issues or submitting pull requests. Contributions are welcome, whether it's for bug fixes, new features, or additional services.

## Contact
For any inquiries, please contact [ramdaninformatika@gmail.com](mailto:ramdaninformatika@gmail.com).
