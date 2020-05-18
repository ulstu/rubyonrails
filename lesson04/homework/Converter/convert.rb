require 'require_all'
require '~/converter/main.rb'
require 'nokogiri'
require 'feedjira'
require 'json'

require_all 'lib'
require_all 'bin'

options = Parser.parse
p options
main = Main.new(options)
main.run
