require 'require_all'
require 'uri'
require '../lib/options/get_options.rb'
require '../main.rb'

options = {}
options = GetOptions.get

main_programm = Main.new(options)
main_programm.run
