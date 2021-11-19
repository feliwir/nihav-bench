#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export PATH=$PATH:~/.cargo/bin
flamegraph -o flamegraph_base.svg $SCRIPT_DIR/nihav-encoder-base -v --input ./test_dec.avi --output null --output-format null --ostream0 encoder=null
mv $SCRIPT_DIR/perf.data $SCRIPT_DIR/perf_dec_base.data
flamegraph -o flamegraph_opt.svg $SCRIPT_DIR/nihav-encoder-opt -v --input ./test_dec.avi --output null --output-format null --ostream0 encoder=null
mv $SCRIPT_DIR/perf.data $SCRIPT_DIR/perf_dec_opt.data
