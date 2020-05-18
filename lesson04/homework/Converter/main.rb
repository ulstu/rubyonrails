# frozen_string_literal: true

class Main
  def initialize(options)
    @input = options[:input]
    @output_format = options[:output]
    @sort = options[:sort]
  end

  def run
    data = if @input.match('^https|http')
             Link_reader.read(@input)
           else
             File_reader.read(@input)
     end

    parsed_data = if Check.check(data) == 'atom'
                    ParseAtom.parse(data)
                  elsif Check.check(data) == 'rss'
                    ParseRss.parse(data)
                  elsif Check.check(data) == 'json'
                    ParseJson.parse(data)
                  else
                    p 'ERROR'
                  end

    if @output.to_s.downcase == 'atom'
      ConvertToAtom.convert(parsed_data)
    elsif @output.to_s.downcase == 'rss'
      ConvertToRss.convert(parsed_data)
    else
      ConvertToJson.convert(parsed_data)
    end
  end
end
