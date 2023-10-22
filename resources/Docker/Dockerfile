FROM ruby:3.2.2

ENV PORT 3000
ENV APP_HOME /beer-api

RUN apt-get update -qq
RUN apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates

RUN apt-get install -y build-essential libpq-dev postgresql-client imagemagick graphviz

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get install -y tzdata \
  && apt-get install -y locales \
  && rm /etc/localtime \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem install bundler
RUN bundler install

ADD . $APP_HOME

# Add a script to be executed every time the container starts.
COPY ./bin/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE $PORT
