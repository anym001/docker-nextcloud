# Security Policy

## Reporting a Vulnerability

Please **do not** report security vulnerabilities through public GitHub
issues, discussions, or pull requests.

Instead, use GitHub's **private vulnerability reporting**:

1. Open the [**Security**](https://github.com/anym001/docker-nextcloud/security)
   tab of this repository.
2. Click **"Report a vulnerability"** to open a private security advisory.

This keeps the report confidential between you and the maintainer until a fix
is available.

### What to include

- A description of the vulnerability and its impact
- Steps to reproduce (proof of concept, affected image tag, configuration)
- Any suggested mitigation, if known

### What to expect

- Acknowledgement of your report as soon as possible.
- An assessment and, where applicable, a fix published as a new image tag.
- Coordinated disclosure — please allow a reasonable window before any public
  disclosure.

## Scope

This repository packages the official
[Nextcloud Docker image](https://hub.docker.com/_/nextcloud) with `ffmpeg`
added. Vulnerabilities in **Nextcloud itself** or in the **official base
image** should be reported upstream (Nextcloud / the Docker Official Images
project). Use this repository's private reporting for issues specific to the
**packaging** here (e.g. the added package layer, the build, or the
workflows).

## Supported Versions

Security fixes are provided for the **latest released image tag** only. Always
run the most recent tag.
