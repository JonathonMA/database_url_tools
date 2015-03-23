FROM ruby:2.1.5-wheezy
MAINTAINER Jonathon M. Abbott <jonathona@everydayhero.com.au>

RUN apt-get update && \
    apt-get install -y postgresql-client

ENV APPDIR /opt/database_url_tools

RUN mkdir $APPDIR
ENV HOME /opt/database_url_tools
WORKDIR /opt/database_url_tools

ADD . /opt/database_url_tools/
RUN bundle install
RUN bundle exec rake install

ENTRYPOINT ["/opt/database_url_tools/script/connect_db.sh"]
