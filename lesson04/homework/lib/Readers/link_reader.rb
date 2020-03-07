# frozen_string_literal: true

require 'open-uri'

# Module for readind content from url
module LinkReader
  def self.read(uri)
    URI.parse(uri).open do |content|
      content
    end
  end
end
