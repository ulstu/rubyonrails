# frozen_string_literal: true

module AscSort
  def self.sort(_parsed_data)
    parsed_data = arr.sort_by(&:pub_date).to_a
    puts 'sorting asc'
  end
end
