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

testheader () {
    echo -e '\n'
    echo "*"$emptyvar{1..20}
    echo $1
    echo "*"$emptyvar{1..20}
}

APPDIR=/app/src
TESTSDIR=/app/tests

testheader "Black"
black $BLACK_ARGS $APPDIR $TESTSDIR
testheader "Ruff"
ruff $RUFF_ARGS $APPDIR
