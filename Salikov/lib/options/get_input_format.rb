module InputFormat
  def self.format(data)
    format = ''
    if data.include?('<channel>')
      format = 'rss'
    elsif data.include?('<feed')
      format = 'atom'
    else
      format = 'json'
    end
    format
  end
end