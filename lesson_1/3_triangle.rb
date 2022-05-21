t_sides = Array.new

def is_rectangular?(a, b, c)
  (c**2).round == a**2 + b**2
end

3.times do |side|
  puts "Введите сторону #{side + 1} треугольника"
  t_sides[side] = gets.to_f 
end

t_sides.sort!

repeats = t_sides.uniq

if repeats.length == 1
  puts "Треугольник равносторонний"
elsif repeats.length == 2
  if is_rectangular?(t_sides[0], t_sides[1], t_sides[2])
    puts "Треугольник равнобедренный и прямоугольный"
  else 
    puts "Треугольник равнобедренный"
  end
else
  if is_rectangular?(t_sides[0], t_sides[1], t_sides[2])
    puts "Треугольник прямоугольный"
  else
    puts "Треугольник неравносторонний, неравнобедренный, непрямоугольный"
  end   
end
