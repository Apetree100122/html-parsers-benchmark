
FROM debian:jessie

RUN apt-get update

RUN apt-get install -y \
    libxml2-dev libxslt1-dev build-essential \
    erlang-base \
    cabal-install libicu-dev \
    golang \
    ruby ruby-dev \
    maven2 default-jdk 
#    php5-cli php5-tidy \
#    python-virtualenv python-lxml \
#    pypy  \
#    mono-runtime mono-dmcs

RUN apt-get install -y sudo git libxml2 wget pkg-config tar curl

# modern NodeJS install
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs mercurial
RUN npm install -g node-gyp

# Erlang
RUN apt-get install -y erlang-asn1 time zlib1g zlib1g-dev

# Ruby environment
ENV GEM_HOME /app/ruby/gem
ENV GEM_PATH /app/ruby/gem

# Go environment
ENV GOPATH /app/golang

# Java / Maven
ENV MAVEN_HOME /app/java
#ENV M2_HOME /app/java

#COPY . /app
WORKDIR /app

# full list
#ENV PLATFORMS="golang ruby nodejs erlang java"

# issues
# erlang : application need upgrade. I think.
# golang : one parser library was redesigned

# working
ENV PLATFORMS="golang nodejs ruby java c-libxml2 perl"

# user command example
# ./prepare.sh
#  ./run 5000 | tee run.log
#
# see Makefile for usage
