require 'nokogiri'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'
# parse from string to Atom
class AtomParse
  attr_accessor :data
  def initialize(data)
    @data = data
    def parse
      xmlfeed = Nokogiri::XML(data)
      xmlfeed.remove_namespaces!
      doc = xmlfeed.xpath('//entry')
      result = []
      doc.each do |el|
      result << {
        title: el.at('title').text,
        link: el.at('link').text,
        id: el.at('id').text,
        updated: el.at('updated').text,
        summary: el.at('summary').text
                }
    end
    result
    end
  end
end

# test
#object = Reader.new("atom.xml")
#texts = object.read
#var = AtomParse.new(texts)
#puts var.parse