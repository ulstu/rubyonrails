class Student
  def initialize(name)
    @name = name
  end

  def say
    puts "Здравствуйте! Меня зовут #{@name}."
    #yield if block_given?
    puts "До свидания!"
  end
end

student = Student.new("Иван Иванов")
#student.say
#student.say do
  #puts("Кирилл Валерьевич, не отчисляйте, пожалуйста!")
#end
#student.say do
  #puts "Пацаны, гоу КС, я создал! Сколько вас будет?"
  #number = gets
  #puts "Значит, жду #{number.chomp} человек."
#end
