#!/usr/bin/env bash

set -e

for f in $1/**/*
do
  echo $f
  ./optimize-png.rb "$f"
done
