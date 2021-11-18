#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -rf $SCRIPT_DIR/nihav
git clone git://git.nihav.org/nihav.git nihav
git clone git://git.nihav.org/nihav-encoder.git  nihav/nihav-encoder

rm -rf $SCRIPT_DIR/nihav-fb
git clone git@github.com:feliwir/nihav-fb.git nihav-fb
git clone git://git.nihav.org/nihav-encoder.git  nihav-fb/nihav-encoder

# Apply regular patches required for proper EA VP6 workflow
cd $SCRIPT_DIR/nihav
find ../patches/ -name *.patch -print0 | xargs -0 git am

# Build an encoder
cd $SCRIPT_DIR/nihav/nihav-encoder
cargo build --release
cp $SCRIPT_DIR/nihav/nihav-encoder/target/release/nihav-encoder $SCRIPT_DIR/nihav-encoder-base

# Apply regular patches required for proper EA VP6 workflow
cd $SCRIPT_DIR/nihav-fb
find ../patches/ -name *.patch -print0 | xargs -0 git am

# Build an optimized encoder
cd $SCRIPT_DIR/nihav-fb/nihav-encoder
cargo build --release
cp $SCRIPT_DIR/nihav-fb/nihav-encoder/target/release/nihav-encoder $SCRIPT_DIR/nihav-encoder-opt