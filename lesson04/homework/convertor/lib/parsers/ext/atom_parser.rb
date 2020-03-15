module AtomParser

  def self.parse(inputData)
    data = []
    xml_doc = Nokogiri::XML(inputData)
    xml_doc.remove_namespaces!
    doc = xml_doc.xpath("//entry") 
    doc.each do |item|
      obj = { 
        id: item.at('id').text,
        title: item.at('title').text,
        summary: item.at('summary').text,
        pubDate: item.at('published').text,
        category: item.at('category').text,
      }
      data << obj
    end
    data
  end

  def self.can?(data)
    Nokogiri::XML(data).errors.empty? && data.include?('</feed>')
  end
end
