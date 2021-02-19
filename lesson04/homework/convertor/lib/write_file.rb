module WriteFile

  def self.write(data, output)
    path = 'files/file.' + output
    File.open(path, 'w') do |file|
      file.puts data
    end
  end
end