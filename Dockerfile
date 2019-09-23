FROM alpine:edge

# Where the source for the image comes from
ENV GIT_ORIGIN="https://github.com/littlemanco/docker--git-crypt"

# The build date in RFC3399 format. For example,
#
#   $ date--rfc-3339=seconds
#   2019-09-20 09:31:02+02:00
#
ARG BUILD_DATE

# The git hash in long format. For example,
#
#   $ git rev-parse HEAD
ARG GIT_HASH

LABEL org.opencontainers.image.ref.name="git-crypt"
LABEL org.opencontainers.image.title="Git Crypt"
LABEL org.opencontainers.image.description="A utility image containing git-crypt"
LABEL org.opencontainers.image.created="$BUILD_DATE"
LABEL org.opencontainers.image.authors="littleman.co <support@littleman.co>"
LABEL org.opencontainers.image.url="$GIT_ORIGIN"
LABEL org.opencontainers.image.documentation="$GIT_ORIGIN"
LABEL org.opencontainers.image.licenses="MIT"

# Valid for GitHub URLs only
LABEL org.opencontainers.image.source="$GIT_ORIGIN/blob/$GIT_HASH/Dockerfile"

# The value of packaged software
LABEL org.opencontainers.image.version="0.0.0"
LABEL org.opencontainers.image.revision="$GIT_HASH"
LABEL org.opencontainers.image.vendor="littleman.co"

RUN apk update && \
    apk add git-crypt