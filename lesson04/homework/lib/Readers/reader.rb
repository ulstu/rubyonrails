# frozen_string_literal: true

# Global class reader
module Reader
  def self.read(input)
    if input =~ %r{/https?:\/\/[\S]+/}
      LinkReader.read(input)
    elsif File.file?(input)
      FileReader.read(input)
    end
  end
end
