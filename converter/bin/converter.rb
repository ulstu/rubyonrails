require 'optparse'
require '../main'


options = {}
OptionParser.new do |opt|
  opt.on('--output OUTPUT') { |o| options[:output] = o }
  opt.on('--input INPUT') { |o| options[:input] = o }
  opt.on('--sort sort') { |o| options[:sort] = o }
end.parse!
 
mainq = Main.new(options)
mainq.run