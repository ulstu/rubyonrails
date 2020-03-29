# frozen_string_literal: true

module JsonConverter
  def self.convert(data)
    JSON.pretty_generate(data)
  end
end
