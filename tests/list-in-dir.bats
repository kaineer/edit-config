#!/usr/bin/env bats

source ./functions.sh

TEST_NAME="list-in-dir"

BASEDIR="$BATS_TEST_DIRNAME/$TEST_NAME"
POLYGON_SOURCE="$BATS_TEST_DIRNAME/polygon"
POLYGON_TARGET="$BASEDIR"
EXPECTED_FILE="$BATS_TEST_DIRNAME/$TEST_NAME.expected.txt"
ACTUAL_FILE="$BASEDIR/$TEST_NAME.actual.txt"
BIN="$BATS_TEST_DIRNAME/../bin/ec"

setup() {
  copy_polygon $POLYGON_SOURCE $POLYGON_TARGET
}

teardown() {
  clear_polygon $BASEDIR
}

@test "List config files" {
  CONFIGS_DIR="$BASEDIR/polygon" $BIN >$ACTUAL_FILE
  diff -y $EXPECTED_FILE $ACTUAL_FILE
}
