puts "Введите a"
a = gets.to_i

puts "Введите b"
b = gets.to_i

puts "Введите c"
c = gets.to_i

d = b ** 2 - 4 * a * c
  
if d < 0
  puts "Корней нет"
else
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  if d > 0
    puts "Корень 1 равен #{x1}, Корень 2 равен #{x2}, дискриминант равен #{d}"
  else
    puts "Корень равен #{x1}, дискриминант равен #{d}"
  end
end
