FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
USER root

RUN apt-get update && \
  apt-get install -y \
  tzdata

RUN apt-get install -y \
  git \
  sudo \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  sqlite3 \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
  sudo apt-get install yarn

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
ENV PATH="${PATH}:/root/.rbenv/bin"
ENV PATH="${PATH}:/root/.rbenv/shims"
RUN exec $SHELL


RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
#ENV PATH="${PATH}:/root/.rbenv/shims"
RUN echo $PATH

RUN mkdir /app
WORKDIR /app

RUN rbenv install 3.0.2 -v
RUN rbenv global 3.0.2

RUN gem install bundler
RUN gem install rails

RUN rails new hello-world
WORKDIR /app/hello-world

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]