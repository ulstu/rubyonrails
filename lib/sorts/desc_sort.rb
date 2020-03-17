# frozen_string_literal: true

module DescSorter
  def self.sort(data)
    data.sort_by { |h| h[:pubDate] }.reverse!
  end
end
