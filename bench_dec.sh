#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

time $SCRIPT_DIR/nihav-encoder-base -v --input ./test_dec.avi --output null --output-format null --ostream0 encoder=null
time $SCRIPT_DIR/nihav-encoder-opt -v --input ./test_dec.avi --output null --output-format null --ostream0 encoder=null