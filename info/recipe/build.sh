#!/bin/bash

echo "Recipe dir is - $RECIPE_DIR"
echo "Package name is - $PKG_NAME"
mkdir -p ${PREFIX}/kdb-core

DIR="${PREFIX}/etc/conda/activate.d"
mkdir -p $DIR

cp ${RECIPE_DIR}/activate.sh ${DIR}/{$PKG_NAME}_activate.sh
cp ${RECIPE_DIR}/deactivate.sh ${DIR}/{$PKG_NAME}_deactivate.sh

cp -rf ${RECIPE_DIR}/../../kdb/* ${PREFIX}/kdb-core/
