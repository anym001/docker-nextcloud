# Official Nextcloud image (apache variant) with ffmpeg added.
#
# The apache variant ships Apache + PHP and is the drop-in default for most
# deployments. We only layer ffmpeg on top so Nextcloud's preview / movie
# thumbnail generation (and apps that shell out to ffmpeg) work out of the box,
# instead of installing it at container start via a script.
#
# NEXTCLOUD_VERSION is the upstream X.Y.Z version (no leading "v"); the build
# workflow passes it and release-check.yml keeps it tracking the official image.
ARG NEXTCLOUD_VERSION=latest
FROM nextcloud:${NEXTCLOUD_VERSION}-apache

# ffmpeg comes from Debian's repos (the base image is Debian-based). It is the
# only addition over the official image; the entrypoint, user handling, volumes
# and healthcheck are all inherited from upstream unchanged.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*
