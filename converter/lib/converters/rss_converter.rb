module RssConverter
    def self.convert(data)
      result = ''
      data.each do |item|
        result += "<item>\n"
        result += "<guid> #{item[:guid]} </guid>\n"
        result += "<title> #{item[:title]} </title>\n"
        result += "<links> #{item[:links]} </links>\n"
        result += "<description> #{item[:description]} </description>\n"
        result += "<pubDate> #{item[:pubDate]} </pubDate>\n"
        result += "<enclosure> #{item[:enclosure]} </enclosure>\n"
        result += "<category> #{item[:category]} </category>\n"
        result += "</item>\n"
      end
        result += '</rss>'
      File.open('../file', 'w') do |file|
        file.puts result
      end
    end
  end