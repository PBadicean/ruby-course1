puts "What's your name ?"
name = gets.chomp
puts "What's your height ?"
height = gets.chomp.to_i
ideal_weight = height - 110
if ideal_weight > 0
  puts "Your ideal weight is #{ideal_weight} ."
else 
  puts "Your weight is already perfect ."
end
