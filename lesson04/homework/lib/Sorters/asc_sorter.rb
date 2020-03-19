# frozen_string_literal: true

# Module for asc sorting
module AscSorter
  def self.sort(input)
    input.sort! { |a, b| DateTime.parse(b[:date]) <=> DateTime.parse(a[:date]) }
  end
end
