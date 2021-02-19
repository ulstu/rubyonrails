module AtomConverter
  def self.convert(data)
    puts 'atom_converter'
    result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<feed version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
    data.each do |item|
      result_xml += "<entry>\n"
      result_xml += "<id> #{item[:id]} </id>\n"
      result_xml += "<title> #{item[:title]} </title>\n"
      result_xml += "<updated'> #{item[:links]} </updated'>\n"
      result_xml += "<published> #{item[:description]} </published>\n"
      result_xml += "<rights> #{item[:rights]} </rights>\n"
      result_xml += "<link> #{item[:link]} </link>\n"
      result_xml += "<summary> #{item[:summary]} </summary>\n"
      result_xml += "<category> #{item[:category]} </category>\n"
      result_xml += "</entry>\n"
    end
    result_xml += "</feed>"
    File.open("../test/fixtures/file.atom", "w") do |file|
      file.puts result_xml
    end
  end
end