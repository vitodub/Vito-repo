def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

def date_calc(day, month, leap = [])
  date_number = 0

  unless month == 1
    for index in 0..(month - 2)
      date_number += leap[index]
    end
  end
  puts "Порядковый номер даты: " + (date_number + day).to_s
end

leap = [31, 29, 31, 30, 31, 30, 31, 30, 31, 30, 31, 30]
non_leap = leap.clone.fill(28, 1, 1)

puts "Введите день"
day = gets.to_i

puts "Введите месяц"
month = gets.to_i

puts "Введите год"
year = gets.to_i

if leap_year?(year)
  date_calc(day, month, leap)
else
  date_calc(day, month, non_leap)
end
