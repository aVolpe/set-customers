# Downloads all the zip files with the data.
#

require './rucs.rb'
require 'uri'
require 'net/http'
require 'fileutils'

module Downloader

  TEMP_FOLDER = '.tmp'

  def self.create_temp_folder()
    FileUtils.mkdir_p TEMP_FOLDER
  end

  def self.get_file_path(name)
    return "#{TEMP_FOLDER}/#{name}"
  end

  def self.save_to_tempfile(url, name)
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

  def self.download()

    self.create_temp_folder
    SETUrls::DATA.each_with_index do |url, index| 
      name = "ruc#{index}.zip";
      if not File.exist?(self.get_file_path(name)) 
        puts "Downloading index #{index} (#{url})"
        self.save_to_tempfile(url, name)
      else 
        puts "Skiping index #{index}, file already exists"
      end
    end

  end

  if __FILE__ == $0
    self.download
  end

end
