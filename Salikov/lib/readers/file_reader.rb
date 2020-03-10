require 'open-uri'

module FileReader
  def self.read(input)
    file = File.open(input)
  end
end