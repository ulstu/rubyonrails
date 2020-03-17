# frozen_string_literal: true

module AtomParser
  def self.parse(data)
    result = []
    doc = Nokogiri::XML(data)
    doc.remove_namespaces!
    doc.xpath('//entry').each do |item|
      result << {
        id: item.at('id').text,
        title: item.at('title').text,
        updated: item.at('updated').text,
        published: item.at('published').text,
        rights: item.at('rights').text,
        link: item.at('link').text,
        summary: item.at('summary').text,
        category: item.at('category').text
      }
    end
    result
  end

  def self.can_parse?(data)
    Nokogiri::XML(data).errors.empty? && data.include?('<entry>')
  end
end
