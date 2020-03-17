# frozen_string_literal: true

module AscSorter
  def self.sort(data)
    data.sort_by { |h| h[:pubDate] }
  end
end
