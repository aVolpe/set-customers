
require './downloader.rb'
require './joiner.rb'
require './unziper.rb'


force = ARGV[0] == 'force'
Downloader::download(force)
Unziper::extract_all(force)
Joiner::write_all()
