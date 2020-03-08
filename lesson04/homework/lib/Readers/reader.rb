# frozen_string_literal: true

# Global class reader
module Reader
  def self.read(input)
    if URI::DEFAULT_PARSER.make_regexp(input)
      LinkReader.read(input)
    elsif File.file?(input)
      FileReader.read(input)
    end
  end
end
