# frozen_string_literal: true

class BaseSort
  def initialize(sort)
    @sort = sort
  end

  def sort(data)
    if @sort == 'asc'
      data = AscSort.sort(data)
      puts 'sorting asc'
    elsif @sort == 'desc'
      data = DescSort.sort(data)
      puts 'sorting desc'
    end
  end
end
