module RssParser
  def self.parse(data)
    data = []

    doc = Nokogiri::XML.open(data)
    doc.xpath("//rss/channel/item").each do |item|
      data << {title: item["title"], description: item['description'] }
    end

    data
    # какая-то логика

    #data # [{title: 'Title', body: 'Body', 'pub_date': '10-10-2019'}, {title: 'Title 2', body: 'Body 2', 'pub_date': '11-10-2019'}]
  end
end
