# CLAUDE.md

Local development infrastructure: databases, caches, admin UIs and Kafka, run with Docker Compose and driven through `make`. There is no application code, build step or test suite here; changes are almost always to `docker-compose.yml`, `Makefile`, `.env.example` and `README.md`.

## Layout

- `docker-compose.yml`: every service. Containers are named `containerize-<service>`; the Compose project is `dockerized-services`.
- `Makefile`: `build_<group>` (`docker compose up -d --build ...`) and `down_<group>` targets. Groups bundle a service with its admin UI: `mysql` = mysql + phpmyadmin, `postgres` = postgres + pgadmin, `postgis` = postgis + pgadmin, `mongo` = mongo + mongo_express. `make build` / `make down` cover `all` (Kafka is **not** in `all`).
- `.env.example`: template for `.env` (gitignored, holds real credentials). Ports are overridable via `DOCKER_<SERVICE>_PORT`.
- `data/`: gitignored bind-mounted data directories (`./data/<service>_data`). Recreating containers keeps data; deleting `data/` destroys it.
- `php-mitigation.ini`: mounted read-only into phpMyAdmin as a PHP2Shell (CVE-2026-109618/109619) mitigation. Keep it mounted.
- `kafka-shells-helper/`: topic create/delete/list scripts that `docker compose exec` into the kafka container.

## Conventions

- Every service sets `platform: "linux/amd64"`, a pinned image tag (avoid `latest` for new services), a `containerize-` container name, a `${DOCKER_<SERVICE>_PORT:-default}` port mapping and `restart: unless-stopped`.
- Adding a service means touching four places: `docker-compose.yml`, the `Makefile` (group variable, `build_*`, `down_*`, and `all` if appropriate), `.env.example` (port and credentials) and `README.md` (service list, start/stop commands, access URL).
- Never commit `.env` or anything under `data/`. Don't put real credentials in `.env.example`.
- Commit messages follow Conventional Commits with a service scope, e.g. `feat(postgis): ...`, `fix(phpmyadmin): ...`. Work on a branch and open a PR to `main`.

## Operational gotchas

- **Restart policy only applies at container creation.** Editing `restart:` does nothing for a running container until it is recreated (`docker compose up -d --force-recreate <service>`). Verify with `docker inspect -f '{{.HostConfig.RestartPolicy.Name}}' containerize-<service>`. A stale `no` policy once left MySQL down after a host reboot.
- Inside the Docker network, services talk to each other by service name and **container** port (e.g. pgAdmin → `postgis:5432`, not the published `5433`).
- phpMyAdmin is intentionally published on all interfaces (port 8082) so it is reachable over Tailscale; don't bind it to `127.0.0.1`.
- PostGIS is a separate PostgreSQL 16 instance with its own `POSTGIS_*` credentials and data directory; it is not an extension on the Postgres 14 service.
- Validate compose changes with `docker compose config -q` (requires a `.env`; the `version` key warning is harmless).
