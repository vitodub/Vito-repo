products = {}
sum = 0

loop do
  puts "Введите наименование товара"
  product = gets.chomp.downcase
  break if product == "стоп"

  puts "Введите цену за единицу"
  price = gets.chomp.to_f

  puts "Введите количество купленного товара"
  quantity = gets.chomp.to_f

  total_product_price = price * quantity

  products[product] = { price: price, quantity: quantity, total_price: total_product_price }
end

products.each do |a, b|
  puts "Куплен товар #{a}, цена за единицу #{b[:price]}, количество #{b[:quantity]}. Итоговая сумма за товар #{b[:total_price]}."
  sum +=b[:total_price]
end

puts "Итоговая сумма всех покупок в корзине: #{sum}."
