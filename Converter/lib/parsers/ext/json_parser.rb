require "json"

module JsonParser
  def self.parse(data)
    puts 'json_parser working'

    parse_data = []
    JSON.parse(data).each do |item|
      parse_data << {
        guid: item["guid"],
        title: item["title"],
        links: item["links"],
        description: item["description"],
        pubDate: item["pubDate"],
        enclosure: item["enclosure"],
        category: item["category"],
      }
    end
    parse_data
  end

  def self.can_parse?(data)
    !!JSON.parse(data)
  rescue JSON::ParserError => _e
    false
  end
end