#!/bin/bash

echo "Recipe dir is - $RECIPE_DIR"

mkdir -p $PREFIX/kdb-core

cp -rf $RECIPE_DIR/../../src $PREFIX/kdb-core/
