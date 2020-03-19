module AscSorter
  def self.sort(data)
    data.sort_by { |h| h[:pubDate].split(/\/|:|-|T|Z/).reverse }
  end
end