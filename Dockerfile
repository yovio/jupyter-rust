FROM jupyter/tensorflow-notebook:latest

USER root
RUN apt-get update --yes &&\
    apt-get install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="$HOME/.cargo/bin:$PATH"
RUN cargo install evcxr_jupyter --no-default-features && \
    evcxr_jupyter --install
