module A
  def hello
    puts "Hello, Other Person!"
  end
end

class Person
  def say_name
    "My name is Person"
  end
end

person = Person.new
puts person.say_name
puts person.hello
puts Person.hello
