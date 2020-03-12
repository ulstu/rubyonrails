require 'json'

module JsonParser
  def self.parse(data)
    a = JSON.parse(data)
    puts a
  end
end