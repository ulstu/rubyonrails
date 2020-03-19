# frozen_string_literal: true

# Module for reading from file
module FileReader
  def self.read(file)
    File.read(file)
  end

  def self.can_read?(input)
    File.file?(input) && File.readable?(input)
  end
end
