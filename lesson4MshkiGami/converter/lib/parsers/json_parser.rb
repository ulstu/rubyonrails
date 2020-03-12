require 'nokogiri'
require 'json'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'

# parsing from string to JSON
class JsonParse
  attr_accessor :data
  def initialize(data)
    @data = data
  end

def parse
  result = []
  puts data
  JSON.parse(data).each do |item|
    result << {
      'guid' => item["guid"],
      'title' => item["title"],
      'links' => item["links"],
      'description' => item["description"],
      'pubDate' => item["pubDate"],
      'enclosure' => item["enclosure"],
      'category' => item["category"]
    }
  end
  result
end
end

# test
# object = Reader.new("jsonik.json")
# texts = object.read
# puts var = JsonParse.new(texts).parse