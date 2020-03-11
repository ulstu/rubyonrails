module JsonConverter
  def self.convert(data)
    result = puts JSON.pretty_generate(data)
    File.open("./test/fixtures/file1", "w") do |file| 
      file.puts result
    end
  end
end
