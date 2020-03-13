# frozen_string_literal: true

require './options.rb'
require '../main.rb'

options = OptionsParser.options

main_programm = Main.new(options)
main_programm.run
