FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
      curl \
      llvm-3.9-dev \
      libclang-3.9-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    cargo install --git https://github.com/servo/rust-bindgen && \
    mv ~/.cargo/bin/bindgen /usr/bin/ && \
    rm -rf ~/.cargo ~/.rustup
