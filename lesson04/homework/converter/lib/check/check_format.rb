# frozen_string_literal: true

# Check if input data matches one of the three formats: Atom, RSS, JSON
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
    else 'error'
    end
  end
end
