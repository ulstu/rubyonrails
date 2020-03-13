# frozen_string_literal: true

module JsonConverter
  def self.convert(data)
    puts result = JSON.pretty_generate(data)
    File.open('../test/fixtures/file.json', 'w') do |file|
      file.puts result
    end
  end
end
