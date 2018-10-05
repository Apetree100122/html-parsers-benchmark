
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

ENV GEM_HOME /app/ruby
ENV GOPATH /app/golang
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
ENV PLATFORMS="golang nodejs ruby java"

# RUN ./prepare.sh

# RUN ./run 5000 | tee run.log

