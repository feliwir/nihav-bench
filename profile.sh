#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export PATH=$PATH:~/.cargo/bin
# flamegraph -o flamegraph_base.svg $SCRIPT_DIR/nihav-encoder-base --input ./test.avi --output output_base.vp6 --output-format ea --ostream0 encoder=vp6,version=vp61,quant=60
# mv $SCRIPT_DIR/perf.data $SCRIPT_DIR/perf_base.data
flamegraph -o flamegraph_opt.svg $SCRIPT_DIR/nihav-encoder-opt --input ./test.avi --output output_opt.vp6 --output-format ea --ostream0 encoder=vp6,version=vp61,quant=60
mv $SCRIPT_DIR/perf.data $SCRIPT_DIR/perf_opt.data
