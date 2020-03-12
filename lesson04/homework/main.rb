# frozen_string_literal: true

require 'require_all'
require_all('bin')

# class converter
module Main
  def self.run
    converter = Converter.new
    converter.run
  end
end

Main.run
