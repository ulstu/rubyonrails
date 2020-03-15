module LinkReader
  def self.read(input)
    data = ''
    OpenURI.open_uri(input) { |f|
      f.each_line {|line| data += line}
    }
    data
  end

  def self.can?(input)
    uri = URI.parse(input)
    %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
  end
end