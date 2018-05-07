FROM ubuntu:16.04

# update apt info & install packages
RUN apt-get update \
    && apt-get install -y \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# npm install n
RUN npm install n -g

# install node stable version
RUN n stable

# add & switch user dev
RUN useradd --user-group --create-home --shell /bin/false dev
ENV HOME=/home/dev
USER dev
WORKDIR $HOME

