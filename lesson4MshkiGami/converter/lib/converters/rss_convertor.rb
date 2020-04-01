# frozen_string_literal: true

# convert to RSS
class RssConvertor
  def self.convert(convert_data)
    result_rss = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
    convert_data.each do |el|
      result_rss += "<item>\n"
      result_rss += '<guid>' + el[:guid] + "</guid>\n"
      result_rss += '<title>' + el[:title] + "</title>\n"
      result_rss += '<link>' + el[:link] + "</link>\n"
      result_rss += '<description>' + el[:specification] + '</description>'
      result_rss += '<pubDate>' + el[:date] + "</pubDate>\n"
      result_rss += '<enclosure>' + el[:enclosure] + "</enclosure>\n"
      result_rss += '<category> ' + el[:category] + "</category>\n"
      result_rss += '</item>'
    end
    result_rss
  end
end
