#!/usr/bin/ruby


require './downloader.rb'

module Joiner

  def self.get_lines(file)
    return File.readlines(file)
  end

  def self.get_files()
    return Dir["#{Downloader::TEMP_FOLDER}/*.txt"]
  end

  def self.create_file()
    return File.new('result.txt', 'w')
  end

  def self.append(file, lines)
    lines.each do |line|
      file.write(line)
    end
  end

  def self.write_all()
    master_file = self.create_file
    self.get_files().each do |file|
      self.append(master_file, get_lines(file))
    end
  end

  if __FILE__ == $0

    write_all

  end
end

