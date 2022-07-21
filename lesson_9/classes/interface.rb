# frozen_string_literal: true

class Interface
  def call
    loop do
      run_interface
    end
  end

  private

  def run_interface
    puts 'С чем будем работать?'
    puts '1. Станция'
    puts '2. Поезд'
    puts '3. Маршрут'
    puts '4. Вагон'

    choice_main = gets.to_i

    case choice_main
    when 1 # Станция
      puts '1. Создать станцию' # станция
      puts '10. Просмотреть список поездов на станции' # станция

      choice_station = gets.to_i

      case choice_station
      when 1
        station_create

      when 10
        station_show_trains
      end

    when 2 # Поезд
      puts '2. Создать поезд' # поезд
      puts '20. Работать с имеющимися поездами' # поезд

      choice_train = gets.to_i

      case choice_train

      when 2
        train_create

      when 20
        if Train.all.empty?
          puts 'Доступных поездов нет'

        else
          puts 'Укажите номер поезда'
          show_list_t(Train.all)

          t_number = gets.to_i - 1

          puts '6. Назначить маршрут поезду' # поезд
          puts '7. Добавить вагоны к поезду' # поезд
          puts '8. Отцепить вагоны от поезда' # поезд
          puts '9. Переместить поезд по маршруту вперед' # поезд
          puts '10. Переместить поезд по маршруту назад' # поезд
          puts '11. Вывести список вагонов у поезда' # поезд

          choice_modify_train = gets.to_i

          case choice_modify_train

          when 6
            train_set_route(t_number)

          when 7
            train_add_wagon(t_number)

          when 8
            train_delete_wagon(t_number)

          when 9
            train_move_to_next_station(t_number)

          when 10
            train_move_to_previous_station(t_number)

          when 11
            train_show_wagons(t_number)
          end
        end
      end

    when 3
      puts '3. Создать маршрут' # маршрут
      puts '30. Работать с имеющимися маршрутами' # маршрут

      choice_route = gets.to_i

      case choice_route

      when 3
        route_create

      when 30
        if Route.all.empty?
          puts 'Доступных маршрутов нет'

        else
          puts 'Укажите номер маршрута'
          show_list_r(Route.all)
        end

        r_number = gets.to_i - 1

        puts '4. Добавить станцию к маршруту' # маршрут
        puts '5. Удалить станцию из маршрута' # маршрут
        puts '11. Просмотреть список станций' # маршрут

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

    when 4
      puts '4. Создать вагон'
      puts '40. Занять место или объем в вагоне'

      w_choice = gets.to_i
      case w_choice
      when 4
        wagon_create
      when 40
        if Wagon.all.empty?
          puts 'Вагонов нет'

        else
          puts 'Укажите номер вагона'
          show_list_w(Wagon.all)
        end

        w_number = gets.to_i - 1

        if Wagon.all[w_number].type == 'Пассажирский'
          Wagon.all[w_number].occupy
        else
          puts "Введите объём, который нужно занять. Оставшийся объём #{Wagon.all[w_number].free_volume}"
          Wagon.all[w_number].occupy(gets.to_i)
        end
      end
    end
  end

  def station_create
    puts 'Введите название станции'
    name = gets.to_s
    Station.new(name)
    puts "Создана станция с названием #{name}"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def train_create
    puts 'Укажите номер типа поезда: 1 - пассажирский, 2 - грузовой'
    t_choice = gets.to_i
    begin
      puts 'Введите номер поезда вида XXX-XX или XXX XX'
      number = gets.to_s
    rescue RuntimeError => e
      puts e.message
      retry
    end

    t_choice == 1 ? PassengerTrain.new(number) : CargoTrain.new(number)
    puts "Создан поезд № #{number}"
  end

  def route_create
    if Station.all.length < 2
      puts 'Добавьте станции'

    else
      puts 'Укажите номер начальной станции'
      show_list_s(Station.all)
      r_start = gets.to_i - 1

      puts 'Укажите номер конечной станции'
      show_list_s(Station.all)
      r_finish = gets.to_i - 1

      begin
        puts 'Введите номер маршрута'
        r_number = gets.to_s

        Route.new(r_number, Station.all[r_start], Station.all[r_finish])
        puts "Создан маршрут с номером #{r_number}"
      rescue RuntimeError => e
        puts e.message
        retry
      end
    end
  end

  def route_add_station
    if Station.all.empty?
      puts 'Станций нет'

    else
      puts 'Укажите номер станции'
      show_list_s(Station.all)
    end

    s_number = gets.to_i - 1

    Route.all[r_number].add_station(Station.all[s_number])
    puts 'Станиця добавлена'
  end

  def route_delete_station
    puts 'Укажите номер станции, которую нужно удалить'
    i = 0
    while i < Route.all[r_number].stations.length
      puts "#{i + 1}. #{Route.all[r_number].stations[i].name}"
      i += 1
    end

    s_number = gets.to_i - 1

    Route.all[r_number].delete_station(Route.all[r_number].stations[s_number])
    puts 'Станиця удалена'
  end

  def train_set_route(t_number)
    if Route.all.empty?
      puts 'Доступных маршрутов нет'

    else
      puts 'Укажите номер маршрута'
      show_list_r(Route.all)
    end

    r_number = gets.to_i - 1

    Train.all[t_number].add_route(Route.all[r_number])
    puts 'Маршрут назначен поезду'
  end

  def train_add_wagon(t_number)
    Train.all[t_number].add_wagon(wagon_create)
    puts 'Вагон добавлен к поезду'
  end

  def train_delete_wagon(t_number)
    if Train.all[t_number].wagons.empty?
      puts 'У поезда нет вагонов'

    else
      Train.all[t_number].delete_wagon
      puts 'Вагон отцеплен от поезда'
    end
  end

  def train_move_to_next_station(t_number)
    if Train.all[t_number].route.nil?
      puts 'У поезда нет маршрута. Добавьте маршрут'

    else
      Train.all[t_number].move_to_next_station
      puts 'Вагон перемещен по маршруту вперед'
    end
  end

  def train_move_to_previous_station(t_number)
    if Train.all[t_number].route.nil?
      puts 'У поезда нет маршрута. Добавьте маршрут'
    else
      Train.all[t_number].move_to_previous_station
      puts 'Вагон перемещен по маршруту назад'
    end
  end

  def route_show_stations
    show_list_r(Route.all)

    r_number = gets.to_i - 1

    Route.all[r_number].show_all_stations
  end

  def station_show_trains
    if Station.all.empty?
      puts 'Доступных станций нет'

    else
      puts 'Укажите номер станции'
      show_list_s(Station.all)

      s_number = gets.to_i - 1

      Station.all[s_number].each_train do |train|
        if Station.all[s_number].trains.empty?
          puts 'Поездов на станции нет'
        else
          puts "Номер поезда: #{train.number}. Тип поезда: #{train.type}. Количество вагонов: #{train.wagons.count}."
        end
      end
    end
  end

  def show_list_s(arr)
    i = 0
    while i < arr.length
      puts "#{i + 1}. #{arr[i].name}"
      i += 1
    end
  end

  def show_list_t(arr)
    i = 0
    while i < arr.length
      puts "#{i + 1}. #{arr[i].number}"
      i += 1
    end
  end

  def show_list_r(arr)
    i = 0
    while i < arr.length
      puts (i + 1), arr[i].show_all_stations
      i += 1
    end
  end

  def show_list_w(arr)
    i = 0
    while i < arr.length
      puts "#{i + 1}. #{arr[i].type}"
      i += 1
    end
  end

  def wagon_create
    puts 'Укажите номер типа вагона: 1 - пассажирский, 2 - грузовой'
    w_choice = gets.to_i

    w_choice == 1 ? (puts 'Укажите колличество свобоных мест') : (puts 'Укажите общий объём')

    seats_or_volume = gets.to_i

    w_choice == 1 ? PassengerWagon.new(seats_or_volume) : CargoWagon.new(seats_or_volume)
  end

  def train_show_wagons(t_number)
    i = 1
    Train.all[t_number].each_wagon do |wagon|
      if wagon.type == 'Пассажирский'
        puts "Номер вагона: #{i}. Тип вагона: #{wagon.type}. Количество свободных мест #{wagon.free_seats}."\
        " Количество занятых мест #{wagon.o_seats}."
      else
        puts "Номер вагона: #{i}. Тип вагона: #{wagon.type}. Количество свободного объёма #{wagon.free_volume}."\
        "Количество занятого объёма #{wagon.o_volume}."
      end
      i += 1
    end
  end
end
