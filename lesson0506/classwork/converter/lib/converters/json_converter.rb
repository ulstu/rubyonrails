module JsonConverter
  def self.convert(data)
    data # [{title: 'Title', body: 'Body', 'pub_date': '10-10-2019'}, {title: 'Title 2', body: 'Body 2', 'pub_date': '11-10-2019'}]
    File.open("file.txt", "w") do |file|
      data.each do |item|
        file.puts item
      end
    end
  end
end
