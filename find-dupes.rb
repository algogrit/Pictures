#!/usr/bin/env ruby

require 'json'

dir_name = ARGV.first

all_files = Dir["./#{dir_name}/*"]

hash_collision = Hash.new { |h, k| h[k] = [] }

all_files.each do |file|
  md5_hash = (`md5 "#{file}"`).split("=").last.strip

  hash_collision[md5_hash] << file
end

dupes = hash_collision.select {|md5_hash, files| files.count > 1 }

puts dupes.to_json
