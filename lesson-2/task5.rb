puts "Введите месяц:"
month = gets.chomp.to_i
puts "Введите день:"
day_num = gets.chomp.to_i
puts "Введите год:"
year = gets.chomp.to_i
months = [31, 28,  31,  30, 31, 30,  31,  31, 30, 31, 30, 31]
if year % 4 == 0 and year % 100 != 0 and month > months[1] or year % 400 == 0 and month > months[1]
  day_num += 1
elsif month == months[1] and day_num == 29
  day_num -= 1
end
months.each_with_index do |el, i|
 break if month == i+1
 day_num += el
end
puts day_num
