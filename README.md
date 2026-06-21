# Nextcloud Docker Images (with ffmpeg)

[![Tests](https://img.shields.io/github/actions/workflow/status/anym001/docker-nextcloud/ci.yml?label=Tests)](https://github.com/anym001/docker-nextcloud/actions/workflows/ci.yml)
[![Build](https://img.shields.io/github/actions/workflow/status/anym001/docker-nextcloud/build-docker.yml?label=Build)](https://github.com/anym001/docker-nextcloud/actions/workflows/build-docker.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/anym001/docker-nextcloud/blob/HEAD/LICENSE)
[![Release](https://img.shields.io/github/v/release/anym001/docker-nextcloud?label=Release)](https://github.com/anym001/docker-nextcloud/releases)
[![GHCR](https://img.shields.io/badge/GHCR-docker--nextcloud-2496ED?logo=docker&logoColor=white)](https://github.com/anym001/docker-nextcloud/pkgs/container/docker-nextcloud)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-docker--nextcloud-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/anym001/docker-nextcloud)

The official [Nextcloud](https://hub.docker.com/_/nextcloud) image (apache
variant) with [`ffmpeg`](https://ffmpeg.org/) added — nothing else is changed.

Everything else is the original image, so all usage, configuration, environment
variables and volumes are exactly as documented upstream. **Please refer to the
official documentation:**

- **Docker image:** https://hub.docker.com/_/nextcloud
- **Nextcloud admin manual:** https://docs.nextcloud.com/

## Usage

Use this image as a drop-in replacement for `nextcloud` — same tags, same
configuration. Images are published to both **GHCR** and **Docker Hub**:

```
docker pull ghcr.io/anym001/docker-nextcloud:latest
docker pull anym001/docker-nextcloud:latest      # Docker Hub
```

Tags:

- `<version>` — e.g. `34.0.0` (fixed, built for each official version)
- `<major>` — e.g. `34` (rolling; tracks the newest patch of that major, like the official `nextcloud:34`)
- `latest` — points to the newest official version

To confirm ffmpeg is available inside the container:

```
docker exec <container> ffmpeg -version
```

## Automated Build System

New official Nextcloud versions are detected automatically on Docker Hub and
rebuilt with ffmpeg; `latest` always points to the newest version.

- `release-check.yml` — daily check of the official image tags; triggers a
  build when a newer stable apache version appears
- `build-docker.yml` — builds the image and pushes it to GHCR and Docker Hub,
  then creates a GitHub Release
- `ci.yml` — lints the Dockerfile and workflows and verifies that ffmpeg is
  present and runnable

## Contributing

PRs are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Security issues:
please report them privately, see [SECURITY.md](SECURITY.md).

## License

The contents of this repository (Dockerfile, workflows, and documentation) are
licensed under the [MIT License](https://github.com/anym001/docker-nextcloud/blob/HEAD/LICENSE).

This project only packages the official Nextcloud image with an additional
package; it does not modify or redistribute Nextcloud's source.
[Nextcloud](https://github.com/nextcloud) and [ffmpeg](https://ffmpeg.org/) are
distributed under their own licenses, and all upstream copyrights and
trademarks remain with their respective owners.

---

Built with [Claude Code](https://claude.com/claude-code).
