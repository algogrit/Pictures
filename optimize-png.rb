#!/usr/bin/env ruby

require 'json'

dir_name = ARGV.first

all_files = Dir["./#{dir_name}/*.png"]

all_files.each do |file|
  webp_name = file.sub(".png", ".webp")

  puts file + " => " + webp_name

  `cwebp "#{file}" -o "#{webp_name}"`
end
