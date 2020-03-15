module AtomConverter

  def self.convert(inputData)
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.feed('xml:lang' => 'ru') {
          inputData.each do |item|
            xml.entry {
              xml.guid item[:guid]
              xml.title item[:title]
              xml.description item[:description]
              xml.pubDate item[:pubDate]
              xml.category item[:category]
            }
          end
      }
    end
    builder.to_xml
  end
end
