# frozen_string_literal: true

# Global class reader
module Reader
  def self.read(input)
    raise 'Uri is empty' if input.nil?

    if URI::DEFAULT_PARSER.make_regexp(input)
      LinkReader.read(input)
    elsif File.file?(input)
      FileReader.read(input)
    end
  end
end
