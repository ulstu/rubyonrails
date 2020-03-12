require 'open-uri'

module LinkReader
  def self.read(input)
    page = open(input)
    page.read
  end
end