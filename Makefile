# Automate execution with Docker
#

# docker command
pwd=`pwd`
platform="ruby"
enable_xpath="true"
docker_cmd=docker run -v $(pwd):/app -it parser_bench

# number of times to repeat the file parsing
repeat=1

all: build fetch_all run_all

.PHONY: run report

# build debian images for all languages
build:
	docker build -t parser_bench .

# fetch application dependency
fetch:
	docker run -v $(pwd):/app \
        -e PLATFORMS=$(platform) \
        -it parser_bench ./prepare.sh

# run all test
run:
	docker run -v $(pwd):/app \
	-e PLATFORMS=$(platform) \
	-it parser_bench ./run.sh $(repeat) $(enable_xpath) | tee run.log

fetch_all:
	$(docker_cmd) ./prepare.sh

run_all:
	$(docker_cmd) ./run.sh $(repeat) $(enable_xpath) | tee report.log

# open a terminal in the container
debug:
	$(docker_cmd) /bin/bash

# convert report to csv
csv:
	ruby to_csv.rb report.log > report.csv
