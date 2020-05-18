# frozen_string_literal: true

# Write data to file
module FileWriter
  def self.write(data, filename)
    filename = 'output.txt' if filename.nil?
    File.write(filename, data)
  end
end
