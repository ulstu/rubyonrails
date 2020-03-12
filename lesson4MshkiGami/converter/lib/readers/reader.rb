require 'open-uri'

# this class read from link
class Reader
  attr_accessor :input
  def initialize(input)
    @input = input
  end

  def read
    data = ''
    file_from_links = open(input)
    file_from_links.each do |line|
      data += line
    end
    data
  end
end

# test
# object = Reader.new("/home/mishigami/Desktop/test/file.txt")
# puts test_string = object.read