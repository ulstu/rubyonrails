require '../lib/options/get_options.rb'
require '../main.rb'

options = {}
options = OptionsParser.options

main_programm = Main.new(options)
main_programm.run
