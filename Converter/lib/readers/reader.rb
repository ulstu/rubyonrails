require 'open-uri'

module Reader
    def self.read(input)
        data = ''
        contents = open(input)
        contents.each do |line|
            data += line
        end
        data
    end
end