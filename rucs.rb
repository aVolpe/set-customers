#!/usr/bin/ruby

# The URL's to download the customer data.
DATA = [];

(0..9).each do |termination|
  DATA.push("http://www.set.gov.py/portal/PARAGUAY-SET/detail?folder-id=repository:collaboration:/sites/PARAGUAY-SET/categories/SET/Informes%20Periodicos/listado-de-ruc-con-sus-equivalencias&content-id=/repository/collaboration/sites/PARAGUAY-SET/documents/informes-periodicos/ruc/ruc#{termination}.zip")
end
