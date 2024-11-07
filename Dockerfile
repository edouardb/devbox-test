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

RUN useradd -m dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -xz -C /usr/local/bin

USER dev
WORKDIR /home/dev

COPY koyeb-entrypoint.sh  /usr/local/bin/koyeb-entrypoint.sh

RUN ln -s /data/vscode /home/dev/.vscode && \
    ln -s /data/vscode-server /home/dev/.vscode-server

CMD ["code", "tunnel", "--name", "gpu-station", "--accept-server-license-terms"]