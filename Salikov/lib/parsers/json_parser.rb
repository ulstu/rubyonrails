require 'json'

module JsonParser
  def self.pars(data)
    # dont work if use JSON gem 
    # ERROR (`parse': 783: unexpected token at '﻿{ (JSON::ParserError))
    # a = JSON.parse(data)
    eval(data)
  end
end