require 'open-uri'

module LinkReader
  def self.read(input)
    link = open(input)
  end
end