module ConvertToJson
  def self.convert(data)
     File.open('output.json', 'w+') { |f| f.write JSON.pretty_generate(data) }
  end
end
