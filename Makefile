# Automate execution with Docker
#

all: build prepare run

pwd=`pwd`
docker_cmd=docker run -v $(pwd):/app -it parser_bench

.PHONY: run

# create a debian image with all dependency
build:
	docker build -t parser_bench .

prepare:
	$(docker_cmd) ./prepare.sh

# run test
run:
	docker run -v $(pwd):/app -it parser_bench ./run.sh 5 | tee report.log
