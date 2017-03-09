puts "Введите значение стороны  a"
a = gets.chomp.to_f
puts "Введите значение стороны  b"
b = gets.chomp.to_f
puts "Введите значение стороны  c"
c = gets.chomp.to_f
i = [a, b, c].sort
if i[2] ** 2 == i[0] ** 2 + i[1] ** 2 
  puts "Треугольник является прямоугольным ."
end
if a == b || a == c || b == c
  puts "Треугольник является равнобедренным."
end
if a == b && a==c
  puts "Треугольник является равностронним"
end
