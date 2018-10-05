#!/bin/bash

wget https://s3.amazonaws.com/rebar3/rebar3
 chmod +x rebar3

./rebar3 local install
./rebar3 get-deps
./rebar3 compile
