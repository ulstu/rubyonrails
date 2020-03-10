require 'nokogiri'
require 'json'
require '../readers/file_reader'

module JsonParser

  def self.parse(data)
   result = []
   
   doc = JSON.parse(data)
   doc.each do |item|
   result << 
    end
   return result
  end

end

obj = FileReader.read('../../test/fixtures/file1')
result = JsonParser.parse(obj)
puts result
  