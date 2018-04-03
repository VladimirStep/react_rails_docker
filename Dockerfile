FROM ruby:2.5.1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y apt-utils apt-transport-https build-essential libpq-dev
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn
ARG HOME=/home/react_rails_docker
RUN mkdir ${HOME}
WORKDIR ${HOME}
COPY Gemfile ${HOME}/Gemfile
COPY Gemfile.lock ${HOME}/Gemfile.lock
RUN bundle install