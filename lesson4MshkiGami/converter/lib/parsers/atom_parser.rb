# frozen_string_literal: true

# parse from string to Atom
class AtomParser
  def self.parse(data)
    xmlfeed = Nokogiri::XML(data)
    xmlfeed.remove_namespaces!
    doc = xmlfeed.xpath('//entry')
    result = []
    doc.each do |el|
      result << {
        title: el.at('title').text,
        link: el.at('link').text,
        date: el.at('updated').text,
        specification: el.at('summary').text
      }
    end
    result
  end

  def self.can_parse?(data)
    data.include?('<feed')
  end
end
