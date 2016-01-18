#!/usr/bin/env ruby
require 'pathname'

exit 1 unless ARGV[0]

full_file_path = File.expand_path("#{ARGV[0]}")

puts "got file path: #{full_file_path}"

exit 1 unless File.extname(full_file_path) == '.xcactivitylog'

puts "it's an activity log!"

basename = Pathname.new("#{full_file_path}").basename.to_s

puts "base: #{basename}"

gzipped_file_name = basename + '.gz'

puts "gzipped: #{gzipped_file_name}"

tmp_gzipped_file_name = "/tmp/#{gzipped_file_name}"

puts "tmp: #{tmp_gzipped_file_name}"

# Create base file name and translated base file name
unzipped_base_file_name = "/tmp/#{basename}"
unzipped_translated_base_file_name = "/tmp/#{basename}-translated"

# Create base analyze file name and path
analyzed_file_name = "#{basename}-swift-analysis.txt"
analyzed_tmp_file_name = "/tmp/#{analyzed_file_name}"

# Make a copy of the file with the gzip extension
copy_status = `cp "#{full_file_path}" "#{tmp_gzipped_file_name}"`
unzip_status = `gzip -d #{tmp_gzipped_file_name}`
translate_status = `tr '\r' '\n' <#{unzipped_base_file_name} >#{unzipped_translated_base_file_name}`
analysis_status = `cat #{unzipped_translated_base_file_name} | grep '[1-9].[0-9]ms' | sort -nr > "#{analyzed_tmp_file_name}"`

copy_desktop_status = `cp #{analyzed_tmp_file_name} ~/Desktop/#{analyzed_file_name}`

removal_status = `rm #{unzipped_base_file_name} #{unzipped_translated_base_file_name} #{analyzed_tmp_file_name}`

puts "Swift Analysis Complete!"
