#!/bin/bash

# Requirements: go >= 1.0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH=$DIR

# Download source code to $GOPATH/src/
go get github.com/moovweb/gokogiri
go get github.com/antchfx/xquery

# Delete binaries
rm -rf bin/

# Compile & write binaries to $GOPATH/bin/
go install bench_gokogiri
go install bench_antchfx

echo "ok"
