# frozen_string_literal: true

require 'require_all'
require './main.rb'
require_all('lib/OptionsParser')

options = OptionsParser.parse
Main.run(options)
