require "nokogiri"

module RssParser
  def self.parse(data)
    puts 'rss_parser working'

    parse_data = []
    xmlfeed = Nokogiri::XML(data)
    doc = xmlfeed.xpath("//item")
    doc.each do |el|
      parse_data << {
        guid: el.at("guid").text,
        title: el.at("title").text,
        links: el.at("link").text,
        description: el.at("description").text,
        pub_date: el.at("pubDate").text,
        enclosure: el.at("enclosure").text,
        category: el.at("category").text,
      }
    end
    parse_data
  end

  def self.can_parse?(data)
    doc = Nokogiri::XML(data).xpath("//rss")
    doc.first.element? && doc.first.children.filter("channel").first.element?
  rescue
    false
  end
end
