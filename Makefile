all := mysql phpmyadmin postgres pgadmin mongo mongo_express redis memcached
mysql := mysql phpmyadmin
postgres := postgres pgadmin
mongo := mongo mongo_express
redis := redis
memcached := memcached

# builds
build:
	echo "Build all :" $(all)
	docker compose up -d --build $(all)
build_mysql:
	echo "Build mysql :" $(mysql)
	docker compose up -d --build $(mysql)
build_postgres:
	echo "Build postgres :" $(postgres)
	docker compose up -d --build $(postgres)
build_mongo:
	echo "Build mongo :" $(mongo)
	docker compose up -d --build $(mongo)
build_redis:
	echo "Build redis :" $(redis)
	docker compose up -d --build $(redis)
build_memcached:
	echo "Build memcached :" $(memcached)
	docker compose up -d --build $(memcached)

# downs
down:
	echo "[Common] Down all containers"
	docker compose down
down_mysql:
	echo "[Common] Down ${mysql} containers"
	docker compose down $(mysql)
down_postgres:
	echo "[Common] Down $(postgres) containers"
	docker compose down $(postgres)
down_mongo:
	echo "[Common] Down $(mongo) containers"
	docker compose down $(mongo)
down_redis:
	echo "[Common] Down $(redis) containers"
	docker compose down $(redis)
down_memcached:
	echo "[Common] Down $(memcached) containers"
	docker compose down $(memcached)