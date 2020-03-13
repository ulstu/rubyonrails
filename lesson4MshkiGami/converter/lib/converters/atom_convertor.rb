require 'json'
require 'nokogiri'
require 'require_all'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/parsers/atom_parser.rb'

# Convert ATOM
class AtomConvertor
  def initialize(convert_data)
    @convert_data = convert_data
  end

  def convert
    result_atom = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <feed version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
      convert_data.each do |el|
        result_atom += "<entry>\n"
        result_atom += '<title>' + el[:title] + "</title>\n"
        result_atom += '<link>' + el[:link] + "</link>\n"
        result_atom += '<id>' + el[:id] + '</id>\n'
        result_atom += '<updated>' + el[:updated] + "</updated>\n"
        result_atom += '<summary>' + el[:summary] + "</summary>\n"
        result_atom += '</item>'
      end
    result_atom
  end
end

# test
# object = Reader.new("atom.xml")
# texts = object.read
# var = AtomParse.new(texts).parse
# puts asd =  ConvertToAtom.new(var).convert_to_atom