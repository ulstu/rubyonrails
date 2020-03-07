# frozen_string_literal: true

# Module for reading from file
module FileReader
  def self.read(file)
    File.open(file)
  end
end
