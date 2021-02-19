require "optparse"
require "optparse/time"
require "require_all"
require_all "../main.rb"

options = {}
parser = OptionParser.new do |opt|
  opt.on("-i", "--input [url]", String) do |input|
    options[:input] = input
  end
  opt.on("-o", "--output-format [rss | json | atom]", String) do |output|
    options[:output] = output
  end
end.parse!

p options
main_program = Main.new(options)
main_program.run

#ruby converter.rb -i http://lenta.ru/rss -o json