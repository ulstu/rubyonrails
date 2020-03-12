module File_reader
  def self.read(path)
    file = File.open(path)
    data = file.read
  end
end
