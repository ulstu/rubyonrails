module AscSorter

  def self.sort(data)
    result = data.sort_by {|x| x[:pubDate] }
  end
end