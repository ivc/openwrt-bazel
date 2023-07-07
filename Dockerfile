FROM ubuntu:22.04
RUN set -ex; \
  useradd -m builder; \
  apt-get update -q; \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
  ; \
  curl -fsSL https://bazel.build/bazel-release.pub.gpg \
  | gpg --dearmor >/usr/share/keyrings/bazel-archive-keyring.gpg \
  ; \
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg]" \
    " https://storage.googleapis.com/bazel-apt stable jdk1.8" \
    >/etc/apt/sources.list.d/bazel.list \
  ; \
  apt-get update -q; \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    bazel \
    build-essential \
    default-jre-headless \
    file \
    gawk \
    gettext \
    git \
    libncurses5-dev \
    libncursesw5-dev \
    libssl-dev \
    python3 \
    rsync \
    unzip \
    wget \
    xsltproc \
    zlib1g-dev \
  ; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*
USER build