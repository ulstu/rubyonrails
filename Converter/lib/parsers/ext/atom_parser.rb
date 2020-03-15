require "nokogiri"

module AtomParser
  def self.parse(data)
    puts 'atom_parser working'

    parse_data = []
    doc = Nokogiri::XML(data)
    doc.remove_namespaces!
    doc.xpath("//entry").each do |item|
      parse_data << {
        id: item.at("id").text,
        title: item.at("title").text,
        updated: item.at("updated").text,
        published: item.at("published").text,
        rights: item.at("rights").text,
        link: item.at("link").text,
        summary: item.at("summary").text,
        category: item.at("category").text,
      }
    end
    parse_data
  end

  def self.can_parce?(data)
    doc = Nokogiri::XML(data).xpath("//feed")
    has_feed = doc.first.element?
    has_id = self.first_element?(doc.first, "id")
    has_title = self.first_element?(doc.first, "title")
    has_updated = self.first_element?(doc.first, "updated")
    result = has_id && has_title && has_updated && has_id
    result
  rescue => e
    false
  end
end