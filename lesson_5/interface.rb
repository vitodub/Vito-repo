class Interface

def call
  loop do
    run_interface
  end
end

private
=begin
Методы show_list_s, show_list_t, show_list_r вспомогательные, доступа к ним у пользователя быть не должно. Поэтому поместил в private. 
Также не должно быть прямого доступа к редактированию интерфейса. Поэтому run_interface также private
=end

def run_interface
  
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
          station_create

        when 10
          station_show_trains
      end

    when 2 #Поезд
      puts "2. Создать поезд" #поезд
      puts "20. Работать с имеющимися поездами" #поезд

      choice_train = gets.to_i

      case choice_train

        when 2
          train_create

        when 20
          if Train.all.empty?
            puts "Доступных поездов нет"

          else
            puts "Укажите номер поезда"
            show_list_t(Train.all)
    
            t_number = gets.to_i - 1

            puts "6. Назначить маршрут поезду" #поезд
            puts "7. Добавить вагоны к поезду" #поезд
            puts "8. Отцепить вагоны от поезда" #поезд
            puts "9. Переместить поезд по маршруту вперед" #поезд
            puts "10. Переместить поезд по маршруту назад" #поезд

            choice_modify_train = gets.to_i

            case choice_modify_train

              when 6
                train_set_route

              when 7
                train_add_wagon

              when 8  
                train_delete_wagon

              when 9
                train_move_to_next_station

              when 10
                train_move_to_previous_station
              end
          end
      end

    when 3
      puts "3. Создать маршрут" #маршрут
      puts "30. Работать с имеющимися маршрутами" #маршрут
  
      choice_route = gets.to_i

      case choice_route

      when 3
        route_create

    when 30
      if Route.all.empty?
        puts "Доступных маршрутов нет"
    
      else 
        puts "Укажите номер маршрута"
        show_list_r(Route.all)
      end
    
      r_number = gets.to_i - 1

      puts "4. Добавить станцию к маршруту" #маршрут
      puts "5. Удалить станцию из маршрута" #маршрут
      puts "11. Просмотреть список станций" #маршрут

      choice_modify_route = gets.to_i

      case choice_modify_route

        when 4
          route_add_station

        when 5
          route_delete_station

        when 11
          route_show_stations
      end
    end
  end
end   

def station_create 
  puts "Введите название станции"
  Station.new(gets.chomp)
  puts "Станция создана"
end

def train_create 
  puts "Введите номер поезда"
  Train.new(gets.to_i)
  puts "Поезд создан"
end

def route_create 
  puts "Введите номер маршрута"
  r_number = gets.to_i

  puts "Введите начальную станцию"
  r_start = gets.chomp

  puts "Введите конечную станцию"
  r_finish = gets.chomp 

  Route.new(r_number, r_start, r_finish)
  puts "Маршрут создан"
end

def route_add_station 
  if Station.all.empty?
    puts "Станций нет"

  else 
    puts "Укажите номер станции"
    show_list_s(Station.all)
  end

  s_number = gets.to_i - 1

  Route.all[r_number].add_station(Station.all[s_number])
  puts "Станиця добавлена"
end

def route_delete_station 
  puts "Укажите номер станции, которую нужно удалить"
  i = 0
  while i < Route.all[r_number].stations.length do
    puts "#{(i + 1)}. #{Route.all[r_number].stations[i].name}"
    i += 1
  end
    
  s_number = gets.to_i - 1

  Route.all[r_number].delete_station(Route.all[r_number].stations[s_number])
  puts "Станиця удалена"
end

def train_set_route 
  if Route.all.empty?
    puts "Доступных маршрутов нет"
    
  else 
    puts "Укажите номер маршрута"      
    show_list_r(Route.all)
  end

  r_number = gets.to_i - 1

  Train.all[t_number].add_route(Route.all[r_number])
  puts "Маршрут назначен поезду"
end

def train_add_wagon 
  Train.all[t_number].add_wagon(Wagon.new)
  puts "Вагон добавлен к поезду"
end

def train_delete_wagon 
  if Train.all[t_number].wagons.empty?
    puts "У поезда нет вагонов"

  else
    Train.all[t_number].delete_wagon
    puts "Вагон отцеплен от поезда"
  end
end

def train_move_to_next_station 
  if Train.all[t_number].route == nil
    puts "У поезда нет маршрута. Добавьте маршрут"

  else
    Train.all[t_number].move_to_next_station
    puts "Вагон перемещен по маршруту вперед"
  end
end

def train_move_to_previous_station 
  if Train.all[t_number].route == nil
    puts "У поезда нет маршрута. Добавьте маршрут"
  else
    Train.all[t_number].move_to_previous_station
    puts "Вагон перемещен по маршруту назад"
  end
end

def route_show_stations 
  show_list_r(Route.all)
    
  r_number = gets.to_i - 1

  Route.all[r_number].show_all_stations
end

def station_show_trains 
  if Station.all.empty?
    puts "Доступных станций нет"

  else
    puts "Укажите название станции"
    show_list_s(Station.all)        

    s_number = gets.to_i - 1

    puts "Укажите номер типа поездов:"
    puts "1. Пассажирский"
    puts "2. Грузовой"

    t_choice = gets.to_i

    t_choice == 1 ? type = "passenger" : type = "cargo"
 
    puts "Количество поездов заданного типа: #{Station.all[s_number].show_train_types(type)}"
  end
end

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
    
end
