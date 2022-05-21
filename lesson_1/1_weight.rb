puts "Введите ваше имя"
name = gets.chomp

puts "Введите ваш рост"
height = gets.to_i

p_weight = (height - 110) * 1.15

puts p_weight > 0 ? "#{name}, ваш идеальный вес #{p_weight}" : "Ваш вес уже оптимальный"
