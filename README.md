# Nextcloud Docker Images (with ffmpeg)

[![Tests](https://img.shields.io/github/actions/workflow/status/anym001/docker-nextcloud/ci.yml?label=Tests)](https://github.com/anym001/docker-nextcloud/actions/workflows/ci.yml)
[![Build](https://img.shields.io/github/actions/workflow/status/anym001/docker-nextcloud/build-docker.yml?label=Build)](https://github.com/anym001/docker-nextcloud/actions/workflows/build-docker.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/anym001/docker-nextcloud/blob/HEAD/LICENSE)
[![Release](https://img.shields.io/github/v/release/anym001/docker-nextcloud?label=Release)](https://github.com/anym001/docker-nextcloud/releases)
[![GHCR](https://img.shields.io/badge/GHCR-docker--nextcloud-2496ED?logo=docker&logoColor=white)](https://github.com/anym001/docker-nextcloud/pkgs/container/docker-nextcloud)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-docker--nextcloud-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/anym001/docker-nextcloud)

This repository provides automated Docker images that are simply the **official
[Nextcloud](https://hub.docker.com/_/nextcloud) image (apache variant) with
[`ffmpeg`](https://ffmpeg.org/) installed**. That removes the need to install
ffmpeg at container start via a script — it is baked into the image, so
Nextcloud's preview / movie thumbnail generation and any apps that shell out to
ffmpeg work out of the box.

The workflow automatically detects new official Nextcloud versions on Docker
Hub and rebuilds the image. The `latest` tag always points to the newest
version.

## Contents

- [Features](#features)
- [Usage](#usage)
- [Tags](#tags)
- [Volume Mounts](#volume-mounts)
- [Ports](#ports)
- [Configuration](#configuration)
- [Automated Build System](#automated-build-system)
- [Contributing](#contributing)
- [License](#license)

## Features

- Official Nextcloud `apache` image as the base — entrypoint, user handling,
  volumes and healthcheck are inherited unchanged
- `ffmpeg` preinstalled for preview / movie thumbnail generation
- Published to both **GHCR** and **Docker Hub**
- Automatically tracks new official Nextcloud releases (daily check)

## Usage

Images are published to **GHCR** and **Docker Hub** — use whichever you prefer:

```
docker pull ghcr.io/anym001/docker-nextcloud:latest
docker pull anym001/docker-nextcloud:latest      # Docker Hub
```

Because this is a drop-in superset of the official image, it accepts the exact
same configuration. Minimal example (SQLite, for testing):

```
docker run -d \
  --name nextcloud \
  -p 8080:80 \
  -v nextcloud_data:/var/www/html \
  ghcr.io/anym001/docker-nextcloud:latest
```

A typical Docker Compose setup with a database, as in the official image's
documentation, works unchanged — just swap the image name for
`ghcr.io/anym001/docker-nextcloud:latest`.

To confirm ffmpeg is available inside the container:

```
docker exec nextcloud ffmpeg -version
```

## Tags

- `<version>` — e.g. `31.0.5` (built for each detected official version)
- `latest` — points to the newest official version

## Volume Mounts

Identical to the official image:

| Container Path     | Purpose                                      |
| :----------------- | :------------------------------------------- |
| `/var/www/html`    | Nextcloud installation and data (persistent) |

See the [official image documentation](https://hub.docker.com/_/nextcloud) for
database, config, and `apps`/`config`/`data` sub-volume options.

## Ports

| Port      | Description           |
| :-------- | :-------------------- |
| `80/tcp`  | Nextcloud (Apache)    |

## Configuration

All configuration is identical to the upstream image and is driven by the same
environment variables (`NEXTCLOUD_ADMIN_USER`, `MYSQL_*` / `POSTGRES_*`,
`NEXTCLOUD_TRUSTED_DOMAINS`, `PHP_MEMORY_LIMIT`, …). Refer to the
[official Nextcloud image documentation](https://hub.docker.com/_/nextcloud).

## Automated Build System

1. `release-check.yml` workflow (daily cron + manual):
   - Reads the official `nextcloud` image tags from Docker Hub
   - Determines the newest stable `apache` version
   - Triggers `build-docker.yml` when it differs from the latest published
     release here, with `LATEST=true`

2. `build-docker.yml` workflow:
   - Builds the official Nextcloud image at the requested version with ffmpeg
   - Pushes to GHCR and Docker Hub
   - Creates a GitHub Release for the version

3. `ci.yml` workflow (every PR + as a gate before publishing):
   - Lints the Dockerfile (Hadolint) and workflows (actionlint)
   - Builds the image and asserts that ffmpeg is installed and runnable

## Contributing

PRs are welcome, especially improvements to:

- Docker security hardening
- Improving automated workflows
- Enhancing testing or verification
- Documentation

## License

The contents of this repository (Dockerfile, workflows, and documentation) are
licensed under the [MIT License](https://github.com/anym001/docker-nextcloud/blob/HEAD/LICENSE).

This project only packages the official Nextcloud image with an additional
package; it does not modify or redistribute Nextcloud's source.
[Nextcloud](https://github.com/nextcloud) and
[ffmpeg](https://ffmpeg.org/) are distributed under their own licenses, and all
upstream copyrights and trademarks remain with their respective owners.

---

Built with [Claude Code](https://claude.com/claude-code).
