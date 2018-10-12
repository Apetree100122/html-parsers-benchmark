#!/bin/bash -e

#TODO Download package in a local cache
mvn -Dmaven.repo.local=/app/java/.m2/repository clean package 

mv target/benchmark-1.0-jar-with-dependencies.jar ./benchmark.jar

echo "ok"
