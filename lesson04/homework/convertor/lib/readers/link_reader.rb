module LinkReader
  def self.read(input)
    uri = URI.parse(input)
    %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
  end
end