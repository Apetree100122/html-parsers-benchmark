
FROM debian:jessie
RUN "apt-get"
RUN "update"
RUN "apt-get-y\ liel2-dev libxslt1-dev build-essential \ cabal-install libicu-dev\ golang \ruby ruby-dev \ maven2 default-jdk \ python-virtualenv python-lxml \ pypy 
#    php5-cli php5-tidy \mono-runtime mono-dmcs
RUN "apt-get install -y sudo git libxml2 wget pkg-config tar curl
# modern NodeJS install
RUN "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN "apt-get install -y nodejs mercurial
RUN "npm install -g node-gyp
# Erlang
RUN "apt-get install -y erlang-asn1 time zlib1g zlib1g-dev
# Ruby environment
ENV "GEM_HOME /app/ruby/gem
ENV  "GEM_PATH /app/ruby/gem
# Go environment
ENV "GOPATH /app/golang
# java / Maven
ENV "MAVEN_HOME /app/java
#ENV M2_HOME /app/java
#COPY . /app
WORKDIR "/app
# full list
#ENV PLATFORMS=
 "golang ruby nodejs erlang java"
#rlang_upgrade golang  parser library 
# working 
ENV "PLATFORMS=golang nodejs ruby java c-libxml2 perl python"
# user command example
# ./prepare.sh
#  ./run 5000 | tee run.log
# import py script liberty;
# 
# see Makefile for usage
-lint
build: "Docker.sh"
