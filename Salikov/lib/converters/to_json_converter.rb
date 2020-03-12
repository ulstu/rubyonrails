require 'json'

module JsonConvert
  def self.convert(data, url_file)
    name_file = url_file.split('/')
    name_file = name_file[-1].split('.')
    File.open("../#{name_file[0]}.json", 'w'){|file|
      file.write(JSON.pretty_generate(data))
    }
  end
end