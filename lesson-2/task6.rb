orders = {}
all_total = 0
loop do
  puts "Введите название товара :"
  produt = gets.chomp
  break if produt == "stop"
  puts "Введите цену за еденицу :"
  price = gets.chomp.to_f
  puts "Введите количество товара :"
  count = gets.chomp.to_f
  total = price * count
  all_total += total
  orders[produt] = {
    price: price,
    count: count,
    total: total
  }
end
puts orders
puts all_total
