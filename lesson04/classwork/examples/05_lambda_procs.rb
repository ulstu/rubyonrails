say_ks = lambda do |game|
  puts "Пацаны, гоу #{game}, я создал! Сколько вас будет?"
  number = gets
  puts "Значит, жду #{number.chomp} человек."
end

say_hd = Proc.new do |game|
  puts "Ребята, гоу в #{game}, я собираю! Сколько вас будет?"
  number = gets
  puts "Значит, жду #{number.chomp} человек."
end

#puts (say_ks.call("ks"))
#puts (say_ks.call)

#puts (say_hd.call("hardball"))
#puts (say_hd.call)

say2_ks = lambda do
  number = gets
  return "Мало народу, не будет кс." if number.chomp.to_i < 5
  puts "Значит, жду #{number.chomp} человек."
end

say3_ks = Proc.new do
  number = gets
  return "Мало народу, не будет кс." if number.chomp.to_i < 5
  puts "Значит, жду #{number.chomp} человек."
end

def correct_say4_ks
  say4_ks = Proc.new do
    number = gets
    return if number.chomp.to_i < 5
    puts "Значит, жду #{number.chomp} человек."
  end
  say4_ks.call
  puts "Всем пока!"
end

puts "Ребята, гоу в кс, я создал! Сколько вас будет?"
#say2_ks.call
#say3_ks.call # Ruby пытается выполнить return из текущего окружения (где был определён блок, то есть прямо отсюда) -> LocalJumpError
#correct_say4_ks
