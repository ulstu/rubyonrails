require "converter/version"
require 'rss'
require 'json'



module Converter
  class Error < StandardError; end
  # Your code goes here...

  def self.convert (options = {})
    input = options.fetch(:input) 
    output = options.fetch(:output)
    sort = options.fetch(:sort)
    file = options.fetch.(:file)

  	if (input.include? 'rss') 
  	  rss_read (input)
  	elsif (input.include? 'json')
  	  json_read (input)
  	elsif (input.include? 'atom')
  	  atom_read (input)	
  	end

  end

  def self.rss_read (input)
    url = "#{input}"
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts feed
    end
  end 

  def self.json_read (input)
    file = File.read(input)
  end  	
end
