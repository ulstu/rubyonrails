module JsonConverter

  def self.convert(data)
    result = JSON.pretty_generate(data)
    result
  end
end