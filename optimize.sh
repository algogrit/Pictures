#!/usr/bin/env bash

for f in $1/**/*
do
  ./optimize-png.rb "$f"
done
