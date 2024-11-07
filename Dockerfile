FROM koyeb/nvidia-dind


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libc6 \
    libstdc++6 \
    curl \
    bash \
    git \
    sudo && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -G docker dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -xz -C /usr/local/bin

USER dev
WORKDIR /home/dev

COPY koyeb-entrypoint.sh  /usr/local/bin/koyeb-entrypoint.sh

ENV VSC_NODE_NAME=${VSC_NODE_NAME:-koyeb-device}

CMD code tunnel --name "$VSC_NODE_NAME" --accept-server-license-terms
