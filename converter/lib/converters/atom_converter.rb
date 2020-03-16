module AtomConverter
    def self.convert(data)
      result = ''
      data.each do |item|
        result += "<entry>\n"
        result += "<id> #{item[:id]} </id>\n"
        result += "<title> #{item[:title]} </title>\n"
        result += "<updated'> #{item[:links]} </updated'>\n"
        result += "<published> #{item[:description]} </published>\n"
        result += "<rights> #{item[:rights]} </rights>\n"
        result += "<link> #{item[:link]} </link>\n"
        result += "<summary> #{item[:summary]} </summary>\n"
        result += "<category> #{item[:category]} </category>\n"
        result += "</entry>\n"
      end
      puts result += '</feed>'
      File.open('../file', 'w') do |file|
        file.puts result
      end
    end
  end