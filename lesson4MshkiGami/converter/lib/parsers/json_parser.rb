# frozen_string_literal: true

# parsing from string to JSON
class JsonParser
  def self.parse(data)
    result = []
    JSON.parse(data).each do |item|
      result << {
        'guid' => item['guid'],
        'title' => item['title'],
        'link' => item['links'],
        'specification' => item['description'],
        'pubDate' => item['pubDate'],
        'enclosure' => item['enclosure'],
        'category' => item['category']
      }
    end
    result
  end

  def self.can_parse?(data)
    data.include?('{')
  end
end
