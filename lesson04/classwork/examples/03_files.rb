file = File.open("file.txt")
file.each do |line|
  puts line
end

File.foreach("file.txt") do |line|
  puts line
end

#File.open("file2.txt", "w") do |file|
  #file.puts "Новая строка"
  #file.puts "Ещё строчка"
#end
