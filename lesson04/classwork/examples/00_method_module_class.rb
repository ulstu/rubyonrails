var1 = 10
var2 = 5
sum = var1 + var2
puts("Sum: #{sum}")

def sum(var1, var2)
  var1 + var2
end
#puts(sum(var1, var2))

module MyMath
  def self.sum(var1, var2)
    var1 + var2
  end
end

#puts MyMath.sum(var1, var2)

class SuperMath
  attr_accessor :var3
  attr_reader :var4 # Добавляет метод на чтение
  attr_writer :var5 # Добавляеть метод на запись

  def initialize(var1, var2)
    @var1 = var1
    @var2 = var2
    @var3 = 0
  end

  def sum
    @var1 + @var2
  end

  def difference
    @var1 - @var2
  end

  def var4
    "var4"
  end
end

#s_math = SuperMath.new(var1, var2)
#puts s_math.sum
#puts s_math.difference
#s_math.var2 = 10 # Не будет работать, так как var2 - переменная экземпляра класса, защищена от записи. Но, добавив в attr_accessor, будет работать
