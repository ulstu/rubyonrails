module RssParser

  def self.parse(data)
    xml_doc = Nokogiri::XML(data)
    data = [];
    doc = xml_doc.xpath("//item") 
    doc.each do |item|
      obj = { 
        guid: item.at('guid').text,
        title: item.at('title').text,
        description: item.at('description').text,
        pubDate: item.at('pubDate').text,
        category: item.at('category').text,
      }
      data << obj
    end

    data
  end
end