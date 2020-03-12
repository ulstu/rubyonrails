# frozen_string_literal: true

require 'open-uri'
# Global class reader
module Reader
  def self.read(input)
    raise 'Uri is empty' if input.nil?

    if File.file?(input)
      FileReader.read(input)
    elsif input.slice(URI.regexp(%w[http https]))
      LinkReader.read(input)
    end
  end
end
