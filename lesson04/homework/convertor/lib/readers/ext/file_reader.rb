module FileReader
  def self.read(input)
    data = ''
    open(input) { |f|
      f.each_line {|line| data += line}
    }
    data
  end

  def self.can?(input)
    File.file? input
  end
end