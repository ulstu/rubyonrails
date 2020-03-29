# frozen_string_literal: true

module RssConverter
  def self.convert(data)
    result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
    data.each do |item|
      result_xml += "<item>\n"
      result_xml += "<guid> #{item[:guid]} </guid>\n"
      result_xml += "<title> #{item[:title]} </title>\n"
      result_xml += "<links> #{item[:links]} </links>\n"
      result_xml += "<description> #{item[:description]} </description>\n"
      result_xml += "<pubDate> #{item[:pubDate]} </pubDate>\n"
      result_xml += "<enclosure> #{item[:enclosure]} </enclosure>\n"
      result_xml += "<category> #{item[:category]} </category>\n"
      result_xml += "</item>\n"
    end
    result_xml += '</rss>'
  end
end
