#!/usr/bin/env ruby

require 'json'

duplicate_files = JSON.parse(File.read(ARGV.first))

duplicate_files.each do |md5_hash, files|
  original, *duplicates = files.sort.reverse

  puts "Preserving original: #{original}!"

  duplicates.each do |duplicate|
    puts "Removing: #{duplicate}..."

    `rm "#{duplicate}"`
  end
end
