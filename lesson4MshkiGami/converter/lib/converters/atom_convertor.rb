# frozen_string_literal: true

# Convert to Atom
class AtomConvertor
  def self.convert(convert_data)
    result_atom = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <feed version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
    convert_data.each do |el|
      result_atom += "<entry>\n"
      result_atom += '<title>' + el[:title] + "</title>\n"
      result_atom += '<link>' + el[:link] + "</link>\n"
      result_atom += '<updated>' + el[:date] + "</updated>\n"
      result_atom += '<summary>' + el[:specification] + "</summary>\n"
      result_atom += '</entry>'
    end
    result_atom
  end
end
