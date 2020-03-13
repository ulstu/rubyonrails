# frozen_string_literal: true

module BaseReader
  def self.read(input)
    if input.include?('http://')
      LinkReader.read(input)
    else FileReader.read(input)
    end
  end
end
