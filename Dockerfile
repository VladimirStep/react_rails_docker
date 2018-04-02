FROM ruby:2.5.1
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential libpq-dev && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
ARG HOME=/home/react_rails_docker
RUN mkdir ${HOME}
WORKDIR ${HOME}
COPY Gemfile ${HOME}/Gemfile
COPY Gemfile.lock ${HOME}/Gemfile.lock
RUN bundle install