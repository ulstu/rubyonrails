require 'open-uri'


class Reader
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def read
    data = ''
    file_contents = open(input)
    file_contents.each do |line|
    data += line
    end
    return data
  end
end


#read_now = Reader.new('https://lenta.ru/rss')

#puts read_now.read

