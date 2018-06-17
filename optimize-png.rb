#!/usr/bin/env ruby

require 'json'

pic_dir = ARGV.first

all_files = Dir["./#{pic_dir}/*.png"]

all_files.each do |file|
  webp_name = file.sub(".png", ".webp")

  puts file + " => " + webp_name

  # Lossy
  `cwebp "#{file}" -o "#{webp_name}"`

  # Lossless
  # `cwebp -lossless "#{file}" -o "#{webp_name}"`
end

command = "mkdir -p '#{pic_dir}'/Compressed"
puts command
system command

command = "mv '#{pic_dir}/'*.webp '#{pic_dir}/Compressed/'"
puts command
exec command
