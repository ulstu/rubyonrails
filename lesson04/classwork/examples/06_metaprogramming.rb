str = "Student"

#puts str.palindrome?

# 1. Добавление новых методов в существующие классы/переопределение существующих методов в run time
class String
  def palindrome?
    self == self.reverse
  end
end
#puts str.palindrome?

# 2. Динамическое создание нового класса, методов класса и экземпляра класса и т.д.
Student = Class.new(Object) do
  def initialize(name)
    @name = name
  end

  define_method :say_name do
    puts("Меня зовут #{@name}")
  end
end

#student = Student.new("Вася Пупкин")
#student.say_name

# 3. Создание access-методов для внутренней переменной класса
class Person
end

instance_methods_before = Person.instance_methods

class Person
  attr_accessor :name
end

#puts Person.instance_methods - instance_methods_before

# 4. Выполнение кода через метод Kernel.eval и другие разновидности
str = "puts('Hello, bad student!')"
#eval(str)
#puts str.instance_eval('length')
#puts str.send(:size)

# 5. Вызов необходимого класса
class BadMan
  def hello
    puts "Хей, пацанчики!"
  end
end

class GoodMan
  def hello
    puts "Здравствуйте, дамы и господа!"
  end
end

kind = "bad"
#if (kind == "bad")
  #man = BadMan.new
  #man.hello
#else
  #man = GoodMan.new
  #man.hello
#end

#puts Module.const_get("#{kind.capitalize}Man").new.hello
