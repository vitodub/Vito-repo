fibonacci = []
value = 0

loop do
  if fibonacci.length < 2
    fibonacci.push(value)
    value += 1
  else
    value = fibonacci[-1] + fibonacci[-2]
    break if value > 100
    fibonacci.push(value)
  end
end

puts fibonacci
