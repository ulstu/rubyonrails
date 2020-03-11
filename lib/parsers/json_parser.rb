module JsonParser
  def self.parse(data)
    result = []
    i = 0
    JSON.parse(data) do |item|
    result[i] = {
      'item' => item
    }
  i += 1
  end
  result
end
end
