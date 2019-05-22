#!/usr/bin/ruby

module SETUrls

  # The URL's to download the customer data.
  DATA = [];
  # this is the current version
  VERSION = 50;

  (0..9).each do |termination|
    DATA.push("http://201.217.50.69/rest/contents/download/collaboration/sites%252FPARAGUAY-SET%252Fdocuments%252Finformes-periodicos%252Fruc%252Fruc#{termination}.zip?version=#{VERSION}")
    #DATA.push("http://201.217.50.69/rest/contents/download/collaboration/sites/PARAGUAY-SET/documents/informes-periodicos/ruc/ruc#{termination}.zip?version=#{VERSION}")
  end

end
