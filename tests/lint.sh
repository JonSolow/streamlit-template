#!/bin/bash

# Arguments for each test
BLACK_ARGS="--check"
RUFF_ARGS="check"

# Use -f for 
while getopts 'f' OPTION; do
  case "$OPTION" in
    f)
      echo "Fix mode"
      BLACK_ARGS=""
      RUFF_ARGS+=" --fix"
      ;;
  esac
done
shift "$(($OPTIND -1))"

set -x

APPDIR=/app/src
TESTSDIR=/app/tests

black $BLACK_ARGS $APPDIR $TESTSDIR
ruff $RUFF_ARGS $APPDIR
