module JsonConverter
    def self.convert(result)
         convertationresult = JSON.pretty_generate(result)
        
          File.open('../file', 'w') do |file|
           
            file.puts convertationresult
          end 
    end
  end
  