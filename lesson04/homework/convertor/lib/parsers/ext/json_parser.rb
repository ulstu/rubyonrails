module JsonParser

  def self.parse(inputData)
    data = [];
    data << JSON.parse(inputData)
    data
  end

  def self.can?(data)
    JSON.parse(data)
    return true
    rescue JSON::ParserError => e
      return false
  end
end
