# Automate execution with Docker
#

# docker command
pwd=`pwd`
docker_cmd=docker run -v $(pwd):/app -it parser_bench

# number of times to repeat the file parsing
repeat=50

all: build prepare run

.PHONY: run

# create a debian image with all dependency
build:
	docker build -t parser_bench .

prepare:
	$(docker_cmd) ./prepare.sh

# run test
run:
	docker run -v $(pwd):/app -it parser_bench ./run.sh $(repeat) | tee report.log

# open a terminal in the container
debug:
	$(docker_cmd) /bin/bash

csv:
	ruby to_csv.rb report.log > report.csv