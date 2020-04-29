# frozen_string_literal: true

# Sort up
class AscSorter
  def self.sort(data)
    data.sort_by { |v| v[:date] }
  end
end
