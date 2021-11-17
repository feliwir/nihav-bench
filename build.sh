#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -rf $SCRIPT_DIR/nihav
git clone git://git.nihav.org/nihav.git nihav
git clone git://git.nihav.org/nihav-encoder.git  nihav/nihav-encoder

export RUSTFLAGS="-C target-feature=+sse4.2,+avx2"
# Apply regular patches required for proper EA VP6 workflow
cd $SCRIPT_DIR/nihav
find ../patches/ -name *.patch -print0 | xargs -0 git am

# Build an encoder
cd $SCRIPT_DIR/nihav/nihav-encoder
cargo build --release
cp $SCRIPT_DIR/nihav/nihav-encoder/target/release/nihav-encoder $SCRIPT_DIR/nihav-encoder-base

# Apply patches that improve performance
cd $SCRIPT_DIR/nihav
find $SCRIPT_DIR/improved/nihav -name *.patch -print0 | xargs -0 git am
cd $SCRIPT_DIR/nihav/nihav-encoder
find $SCRIPT_DIR/improved/nihav-encoder -name *.patch -print0 | xargs -0 git am

cd $SCRIPT_DIR/nihav/nihav-encoder
cargo build --release
cp $SCRIPT_DIR/nihav/nihav-encoder/target/release/nihav-encoder $SCRIPT_DIR/nihav-encoder-opt