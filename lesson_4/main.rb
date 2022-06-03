require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'


def show_list_s(arr)
  i = 0
  while i < arr.length do
    puts "#{i + 1}. #{arr[i].name}"
    i += 1
  end
end

def show_list_t(arr)
  i = 0
  while i < arr.length do
    puts "#{i + 1}. #{arr[i].number}"
    i += 1
  end
end

def show_list_r(arr)
  i = 0
  while i < arr.length do
    puts (i + 1), arr[i].show_all_stations
    i += 1
  end
end

stations = []
trains = []
routes = []

puts "С чем будем работать?"
puts "1. Станция"
puts "2. Поезд"
puts "3. Маршрут"

choice_main = gets.to_i

case choice_main
  when 1 #Станция
    puts "1. Создать станцию" #станция
    puts "10. Просмотреть список поездов на станции" #станция

    choice_station = gets.to_i

    case choice_station
      when 1
        puts "Введите название станции"
        stations << Station.new(gets.chomp)
        puts "Станция создана"

      when 10
        if stations.empty?
      	  abort "Доступных станций нет"

        else
          puts "Укажите название станции"
          show_list_s(stations)        

        s_number = gets.to_i - 1

        puts "Укажите номер типа поездов:"
        puts "1. Пассажирский"
        puts "2. Грузовой"

        t_choice = gets.to_i

        t_choice == 1 ? type = "passenger" : type = "cargo"
 
        puts stations[s_number].show_train_types(type)
      end
    end

  when 2 #Поезд
    puts "2. Создать поезд" #поезд
    puts "20. Работать с имеющимися поездами" #поезд

    choice_train = gets.to_i

    case choice_train

      when 2
      	puts "Введите номер поезда"
        trains << Train.new(gets.to_i)
        puts "Поезд создан"

      when 20
      	if trains.empty?
          abort "Доступных поездов нет"

        else
      	  puts "Укажите номер поезда"
          show_list_t(trains)
    
          t_number = gets.to_i - 1

          puts "6. Назначить маршрут поезду" #поезд
          puts "7. Добавить вагоны к поезду" #поезд
          puts "8. Отцепить вагоны от поезда" #поезд
          puts "9. Переместить поезд по маршруту вперед" #поезд
          puts "10. Переместить поезд по маршруту назад" #поезд

          choice_modify_train = gets.to_i

          case choice_modify_train

            when 6
              if routes.empty?
                abort "Доступных маршрутов нет"
    
              else 
                puts "Укажите номер маршрута"      
                show_list_r(routes)
              end

              r_number = gets.to_i - 1

              trains[t_number].add_route(routes[r_number])
              puts "Маршрут назначен поезду"

            when 7
          	  trains[t_number].add_wagon(Wagon.new)
              puts "Вагон добавлен к поезду"

            when 8	
              if trains[t_number].wagons.empty?
                puts "У поезда нет вагонов"

              else
                trains[t_number].delete_wagon
                puts "Вагон отцеплен от поезда"
              end

            when 9
          	  if trains[t_number].route == nil
                puts "У поезда нет маршрута. Добавьте маршрут"

              else
                trains[t_number].move_to_next_station
                puts "Вагон перемещен по маршруту вперед"
              end

            when 10
              if trains[t_number].route == nil
                puts "У поезда нет маршрута. Добавьте маршрут"
              else
                trains[t_number].move_to_previous_station
                puts "Вагон перемещен по маршруту назад"
              end

            end
        end
    end

  when 3
    puts "3. Создать маршрут" #маршрут
    puts "30. Работать с имеющимися маршрутами" #маршрут
  
    choice_route = gets.to_i

    case choice_route

    when 3
  	  puts "Введите номер маршрута"
      r_number = gets.to_i

      puts "Введите начальную станцию"
      r_start = gets.chomp

      puts "Введите конечную станцию"
      r_finish = gets.chomp 

      routes << Route.new(r_number, r_start, r_finish)
      puts "Маршрут создан"

  when 30
    if routes.empty?
      abort "Доступных маршрутов нет"
    
    else 
      puts "Укажите номер маршрута"
      show_list_r(routes)
    end
    
    r_number = gets.to_i - 1

  	puts "4. Добавить станцию к маршруту" #маршрут
    puts "5. Удалить станцию из маршрута" #маршрут
    puts "11. Просмотреть список станций" #маршрут

    choice_modify_route = gets.to_i

    case choice_modify_route

      when 4
      	if stations.empty?
          puts "Станций нет"

        else 
          puts "Укажите номер станции"
          show_list_s(stations)
        end

        s_number = gets.to_i - 1

        routes[r_number].add_station(stations[s_number])
        puts "Станиця добавлена"

       when 5
         puts "Укажите номер станции, которую нужно удалить"
         i = 0
         while i < routes[r_number].stations.length do
           puts "#{(i + 1)}. #{routes[r_number].stations[i].name}"
           i += 1
        end
    
         s_number = gets.to_i - 1

         routes[r_number].delete_station(routes[r_number].stations[s_number])
         puts "Станиця удалена"

       when 11
         show_list_r(routes)
    
         r_number = gets.to_i - 1

         routes[r_number].show_all_stations
    end
  end
end
