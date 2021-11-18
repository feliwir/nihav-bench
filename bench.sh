#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

time $SCRIPT_DIR/nihav-encoder-base -v --input ./test.avi --output output_base.vp6 --output-format ea --ostream0 encoder=vp6,version=vp61,quant=60
time $SCRIPT_DIR/nihav-encoder-opt -v --input ./test.avi --output output_opt.vp6 --output-format ea --ostream0 encoder=vp6,version=vp61,quant=60