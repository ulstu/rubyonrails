# frozen_string_literal: true

# Module for desc sorting
module DescSorter
  def self.sort(input)
    input.sort! { |a, b| DateTime.parse(a[:date]) <=> DateTime.parse(b[:date]) }
  end
end
