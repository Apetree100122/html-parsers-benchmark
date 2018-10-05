#!/bin/bash

# Requirements: go >= 1.0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH=$DIR

# Download source code to $GOPATH/src/
go get github.com/moovweb/gokogiri
go get go.marzhillstudios.com/pkg/go-html-transform/h5
tar -xzf go-2c8a88c1efce-exp-html.tar.gz -C $DIR/src

# Compile & write binaries to $GOPATH/bin/
go install bench_gokogiri
go install bench_exp_html 

# need to upgrade the code because of library changes
#go install bench_h5

echo "ok"
