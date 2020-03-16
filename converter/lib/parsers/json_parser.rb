module JsonParser
    def self.parse(data)
      result = []
      JSON.parse(data).each do |item|
        result << {
          guid: item['guid'],
          title: item['title'],
          links: item['links'],
          description: item['description'],
          pubDate: item['pubDate'],
          enclosure: item['enclosure'],
          category: item['category']
        }
      end
      result
    end