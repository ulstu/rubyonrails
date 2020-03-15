module JsonParser

  def self.parse(inputData)
    data = [];
    test123 = []
    JSON.parse(inputData).each do |item|
      data << {
        guid: item['guid'],
        title: item['title'],
        description: item['description'],
        pubDate: item['pubDate'],
        category: item['category']
      }
    end
    data
  end

  def self.can?(data)
    JSON.parse(data)
    return true
    rescue JSON::ParserError => e
      return false
  end
end
