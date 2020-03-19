# frozen_string_literal: true

module File_reader
  def self.read(path)
    file = File.open(path)
    data = file.read
  end
end
