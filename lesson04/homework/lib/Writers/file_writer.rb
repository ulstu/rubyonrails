# frozen_string_literal: true

require 'securerandom'

# Module for write string in file
module FileWriter
  def self.write(input, format)
    file_name = SecureRandom.hex(10) + '.' + format
    File.open(file_name, 'w') do |file|
      file.write(input)
    end
  end
end
