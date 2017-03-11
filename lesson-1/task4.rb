puts "введите значение a"
a = gets.chomp.to_f
puts "введите значение b"
b = gets.chomp.to_f
puts "введите значение c"
c = gets.chomp.to_f
d = (b) ** 2 - 4 * a * c
if d < 0
  puts "Дискриминант равен #{d} корня нет"
elsif d > 0
  x1 = (-b + Math.sqrt(d)) / 2 * a 
  x2 = (-b - Math.sqrt(d)) / 2 * a 
  puts "Дискриминант равен #{d}, корень1 равен #{x1}, корень2 равен #{x2}"
else 
  x2 = (-b - Math.sqrt(d)) / 2 * a 
  puts "Дискриминант равен #{d}, корень равен #{x2}"
end
