#!/usr/bin/ruby

module SETUrls

  # The URL's to download the customer data.
  DATA = [];
  # this is the current version
  VERSION = 9;


  (0..9).each do |termination|
    DATA.push("http://www.set.gov.py/rest/contents/download/collaboration/sites/PARAGUAY-SET/documents/informes-periodicos/ruc/ruc#{termination}.zip?version=#{VERSION}")
  end

end
