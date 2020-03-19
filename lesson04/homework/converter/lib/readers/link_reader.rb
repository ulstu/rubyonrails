# frozen_string_literal: true

require 'open-uri'

module Link_reader
  def self.read(url)
    open(url).read
  end
end
