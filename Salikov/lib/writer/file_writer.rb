module FileWriter
  def self.write(data, link)
    file_name = link.split('/')
    file_name = file_name[-1].split('.')
    File.write("../#{file_name[0]}", data)
  end
end