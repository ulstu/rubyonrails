module LinkReader
  def self.read(input)
    data = ''
    file_contents = open(input)
    file_contents.each do |line|
    data += line
    end
    return data
  end
end
