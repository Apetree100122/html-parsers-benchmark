#!/bin/bash
source ../lib.sh

parsers=`ls ./bin/bench_*`

test_file=$1
num_iterations=$2
enable_xpath=$3

for parser in $parsers; do
    print_header $parser $test_file
    timeit $parser $test_file $num_iterations $enable_xpath
done
