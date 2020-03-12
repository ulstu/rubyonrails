module GetInputFormat
  def self.get_format(data)
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