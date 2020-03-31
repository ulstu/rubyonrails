# frozen_string_literal: true

# Sort down
class DescSorter
  def self.sort(data)
    data.sort_by { |v| v[:date] }.reverse!
  end
end
