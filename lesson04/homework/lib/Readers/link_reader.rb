# frozen_string_literal: true

require 'open-uri'

# Module for readind content from url
module LinkReader
  def self.read(uri)
    URI.parse(uri).read
  end

  def self.can_read?(input)
    return true if input.slice(URI.regexp(%w[http https]))

    false
  end
end
