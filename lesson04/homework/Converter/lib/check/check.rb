# frozen_string_literal: true

module Check
  def self.valid_json?(json)
    JSON.parse(json)
    true
  rescue JSON::ParserError => e
    false
  end

  def self.check(data)
    str = data.to_s
    if str.include? '<feed'
      'atom'
    elsif str.include? '<rss'
      'rss'
    elsif valid_json?(str)
      'json'
    end
  end
end
