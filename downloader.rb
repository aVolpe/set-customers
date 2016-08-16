# Downloads all the zip files with the data.
#

require './rucs.rb'
require 'uri'
require 'net/http'
require 'fileutils'

TEMP_FOLDER = '.tmp'

def create_temp_folder()
  FileUtils.mkdir_p TEMP_FOLDER
end

def get_file_path(name)
  return "#{TEMP_FOLDER}/#{name}"
end

def save_to_tempfile(url, name)
  uri = URI.parse(url)
  Net::HTTP.start(uri.host, uri.port) do |http|
    resp = http.get(uri.path)
    file = File.new(get_file_path(name), 'wb+')
    file.binmode
    file.write(resp.body)
    file.flush
    file
  end
end


create_temp_folder
SETUrls::DATA.each_with_index do |url, index| 
  name = "ruc#{index}.zip";
  if not File.exist?(get_file_path(name)) 
    puts "Downloading index #{index} (#{url})"
    save_to_tempfile(url, name)
  else 
    puts "Skiping index #{index}, file already exists"
  end
end

