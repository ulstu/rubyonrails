# frozen_string_literal: true

# require 'open-uri'

# this class read
class Reader
  def self.read(input)
    data = ''
    open(input).each { |line| data += line }
    data
  end
end
