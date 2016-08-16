#!/usr/bin/ruby


require './downloader.rb'
require 'zip'

module Unziper


  def self.unzip(file) 
    Zip::File.open(file) do |zipfile|
      zipfile.each do |entry|
        # The 'next if...' code can go here, though I didn't use it
        unless File.exist?(entry.name)
          FileUtils::mkdir_p(File.dirname(entry.name))
          zipfile.extract(entry, "#{Downloader::TEMP_FOLDER}/#{entry.name}") 
        end
      end
    end
  end

  def self.extract_all()
    Dir["#{Downloader::TEMP_FOLDER}/*.zip"].each do |file|
      self.unzip(file)
    end
  end

  if __FILE__ == $0
    self.extract_all
  end
end

