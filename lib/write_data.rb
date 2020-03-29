# frozen_string_literal: true

module WriteData
  def self.write(data, output)
    path = '../test/fixtures/file.' + output
    File.open(path, 'w') do |file|
      file.puts data
    end
  end
end
