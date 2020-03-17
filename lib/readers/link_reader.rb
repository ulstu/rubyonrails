# frozen_string_literal: true

module LinkReader
  def self.read(input)
    data = ''
    file_contents = open(input)
    file_contents.each do |line|
      data += line
    end
    data
  end

  def self.can_read?(input)
    input =~ URI::DEFAULT_PARSER.make_regexp
  end
end
