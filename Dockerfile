FROM ubuntu:24.04
LABEL maintainer="pennaliflake@gmail.com"

ARG net_proxy=""

SHELL ["/bin/bash", "-c"]

RUN <<EOF
    if [ -n "$net_proxy" ]; then \
        echo "HTTP_PROXY=\"http://${net_proxy}\"" >> ${HOME}/.bashrc; \
        echo "HTTPS_PROXY=\"http://${net_proxy}\"" >> ${HOME}/.bashrc; \
    fi
    source ${HOME}/.bashrc
    apt update -y && apt install sudo -y
    useradd -m -d /home/pennix pennix
    echo pennix:penn | chpasswd
    echo "pennix ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    usermod -aG root pennix
EOF

USER pennix

RUN <<EOF
    if [ -n "$net_proxy" ]; then \
        echo "HTTP_PROXY=\"http://${net_proxy}\"" >> ${HOME}/.bashrc; \
        echo "HTTPS_PROXY=\"http://${net_proxy}\"" >> ${HOME}/.bashrc; \
    fi
EOF

WORKDIR /home/riscv