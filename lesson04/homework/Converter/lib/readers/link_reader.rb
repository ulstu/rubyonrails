require 'open-uri'

module Link_reader
  def self.read(url)
    data = open(url).read
  end
end
