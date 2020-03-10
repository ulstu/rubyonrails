require 'open-uri'

module LinkReader
  def self.read(input)
    open(input)
  end
end