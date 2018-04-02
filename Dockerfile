FROM ruby:2.5.1
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
ARG HOME=/home/react_rails_docker
RUN mkdir ${HOME}
WORKDIR ${HOME}
COPY Gemfile ${HOME}/Gemfile
COPY Gemfile.lock ${HOME}/Gemfile.lock
RUN bundle install