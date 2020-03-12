module RssConverter
  def self.convert(data)
    result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">"
    data # [{title: 'Title', body: 'Body', 'pub_date': '10-10-2019'}, {title: 'Title 2', body: 'Body 2', 'pub_date': '11-10-2019'}]
    data.each do |item|
      result_xml += "<item>"
      result_xml += "<title>" + item['title'] + "</title>"
      result_xml += "<description>" + item['body'] + "</description>"
      result_xml += "</item>"
    end
    result_xml += "</rss>"

    File.open("file.rss", "w") { |file| file.puts result_xml }
  end
end
