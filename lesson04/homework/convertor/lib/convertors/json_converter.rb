module JsonConverter

  def self.convert(data)
    result = JSON.generate(data)
    File.open('files/file.json', 'w') do |file|
      file.puts result
    end
  end
end