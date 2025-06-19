FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  git curl unzip xz-utils zip libglu1-mesa wget \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/flutter/flutter.git -b stable /root/flutter
ENV PATH="/root/flutter/bin:/root/.pub-cache/bin:${PATH}"

RUN flutter doctor
RUN flutter --version