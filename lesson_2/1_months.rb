months = { "Январь" => 30,
  "Февраль" => 28,
  "Март" => 30,
  "Апрель" => 31,
  "Май" => 30,
  "Июнь" => 31,
  "Июль" => 30,
  "Август" => 31,
  "Сентябрь" => 30,
  "Октябрь" => 31,
  "Ноябрь" => 30,
  "Декабрь" => 31
}

months_30_days = months.select { |month, num_of_days| num_of_days == 30 }

puts "Месяцы, у которых количество дней ровно 30: #{months_30_days.keys}"
