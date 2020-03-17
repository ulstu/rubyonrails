# frozen_string_literal: true

module BaseReader
  def self.read(input)
    readers = %w[FileReader LinkReader].freeze
    data = ''
    readers.each do |reader_name|
      if Module.const_get(reader_name).can_read?(input)
        data = Module.const_get(reader_name).read(input)
      end
    end
    data
  end
end
