module Reader
  def self.read(input)
    data = ''
    open(input) { |f|
      f.each_line {|line| data += line}
    }
    data
  end
end