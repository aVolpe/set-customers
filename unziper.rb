#!/usr/bin/ruby


require './downloader.rb'
require 'zip'
require 'fileutils'

module Unziper


  def self.unzip(file, force) 
    Zip::File.open(file) do |zipfile|
      zipfile.each do |entry|
        name = "#{Downloader::TEMP_FOLDER}/#{entry.name}"
        if File.exist?(name)
          if force
            FileUtils::rm(name)
          else
            puts "The file #{name} already exists, skiping"
            next
          end
        end
        unless File.exist?(entry.name)
          FileUtils::mkdir_p(File.dirname(entry.name))
          zipfile.extract(entry, name) 
        end
      end
    end
  end

  def self.extract_all(force=false)
    Dir["#{Downloader::TEMP_FOLDER}/*.zip"].each do |file|
      self.unzip(file, force)
    end
  end

  if __FILE__ == $0
    self.extract_all
  end
end

