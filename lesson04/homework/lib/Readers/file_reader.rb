# frozen_string_literal: true

# Module for reading from file
module FileReader
  def self.read(file)
    File.read(file)
  end

  def self.can_read?(input)
    return true if File.file?(input)

    false
  end
end
