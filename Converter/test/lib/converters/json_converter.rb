module JsonConverter
    def self.convert(data)
        File.open("file.txt", "w") do |file|
            data.each do |item|
                file.puts item
            end
        end
    end
end