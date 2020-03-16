# frozen_string_literal: true

module DescSort
  def self.sort(_data)
    data = arr.sort_by(&:pub_date).reverse.to_a
    puts 'sorting desc'
  end
end
