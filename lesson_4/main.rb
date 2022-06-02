require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'

stations = [Station.new("Калуга"), Station.new("Брянск")]
trains = [Train.new(111), Train.new(222)]
a = Route.new(1, Station.new("Москва"), Station.new("Тверь"))
b = Train.new(111)
routes = [Route.new(1, Station.new("Москва"), Station.new("Тверь")), Route.new(2, Station.new("Пермь"), Station.new("Екатеринбург"))]

#puts routes[1].show_all_stations
#puts (routes.select { |n| n.number == 2 }).class 
#puts routes[1].stations[0].name

#puts routes[0].delete_station(routes[0].stations[0])
#puts routes[0].show_all_stations

#puts b.add_route(a)

puts "Введите номер операции:"
puts "1. Создать станцию"
puts "2. Создать поезд"
puts "3. Создать маршрут"
puts "4. Добавить станцию к маршруту"
puts "5. Удалить станцию из маршрута"
puts "6. Назначить маршрут поезду"
puts "7. Добавить вагоны к поезду"
puts "8. Отцепить вагоны от поезда"
puts "9. Переместить поезд по маршруту вперед"
puts "10. Переместить поезд по маршруту вперед"
puts "11. Переместить поезд по маршруту назад"
puts "12. Переместить поезд по маршруту назад"
puts "13. Просмотреть список станций по маршруту"
puts "14. Просмотреть список поездов на станции"

choice = gets.to_i

case choice
  when 1 #Создать станцию
    puts "Введите название станции"
    stations << Station.new(gets.chomp)
  
  when 2 #Создать поезд
    puts "Введите номер поезда"
    trains << Train.new(gets.to_i)
    puts "Поезд создан"
  
  when 3 #Создать маршрут
    puts "Введите номер маршрута"
    r_number = gets.to_i

    puts "Введите начальную станцию"
    r_start = gets.chomp

    puts "Введите конечную станцию"
    r_finish = gets.chomp 

    routes << Route.new(r_number, r_start, r_finish)
    puts "Маршрут создан"

  when 4 #Добавить станцию к маршруту
    if routes.empty?
      puts "Маршрутов нет"
    
    else 
      puts "Укажите номер маршрута"
      
      i = 0
      while i < routes.length do
        puts (i + 1), routes[i].show_all_stations
        i += 1
      end
    end

    r_number = gets.to_i - 1

    if stations.empty?
      puts "Станций нет"

    else 
      puts "Укажите номер станции"
      i = 0
      while i < routes.length do
        puts "#{i + 1}. #{stations[i].name}"
        i += 1
      end
    end

    s_number = gets.to_i - 1

    routes[r_number].add_station(stations[s_number])
    puts "Станиця добавлена"
      
  when 5 #Удалить станцию из маршрута
    if routes.empty?
      puts "Маршрутов нет"
    
    else 
      puts "Укажите номер маршрута"      
      i = 0
      while i < routes.length do
        puts (i + 1), routes[i].show_all_stations
        i += 1
      end
    end

    r_number = gets.to_i - 1

    puts "Укажите номер станции, которую нужно удалить"
    i = 0
      while i < routes[r_number].stations.length do
        puts "#{(i + 1)}. #{routes[r_number].stations[i].name}"
        i += 1
      end
    
    s_number = gets.to_i - 1

    routes[r_number].delete_station(routes[r_number].stations[s_number])
    puts "Станиця удалена"
      
  when 6 #Назначить маршрут поезду
    puts "Укажите номер поезда, которому нужно назначить маршрут"
    i = 0
    while i < trains.length do
      puts "#{(i + 1)}. #{trains[i].number}"
      i += 1
    end
    
    t_number = gets.to_i - 1

    if routes.empty?
      puts "Маршрутов нет"
    
    else 
      puts "Укажите номер маршрута"      
      i = 0
      while i < routes.length do
        puts (i + 1), routes[i].show_all_stations
        i += 1
      end
    end

    r_number = gets.to_i - 1

    trains[t_number].add_route(routes[r_number])
    puts "Маршрут назначен поезду"    

  when 7 #Добавить вагоны к поезду
    puts "Укажите номер поезда, которому нужно добавить вагон"
    i = 0
    while i < trains.length do
      puts "#{(i + 1)}. #{trains[i].number}"
      i += 1
    end
    
    t_number = gets.to_i - 1
    trains[t_number].add_wagon(Wagon.new)
    puts "Вагон добавлен к поезду"

  when 8 #Отцепить вагоны от поезда
    puts "Укажите номер поезда, которому нужно отцепить вагон"
    i = 0
    while i < trains.length do
      puts "#{(i + 1)}. #{trains[i].number}"
      i += 1
    end

    t_number = gets.to_i - 1

    if trains[t_number].wagons.empty?
      puts "У поезда нет вагонов"
    else
      trains[t_number].delete_wagon
      puts "Вагон отцеплен от поезда"
    end    
    
  when 9
    puts "ok"
  when 10
    puts "ok"
  when 11
    puts "ok"
  when 12
    puts "ok"
  when 13
    puts "ok"
  when 14
    puts "ok"
  end
