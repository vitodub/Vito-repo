class Train
  attr_reader :type, :speed, :wagon_amount, :current_station

  def initialize(number, type, wagon_amount)
    @number = number
    @type = type
    @wagon_amount = wagon_amount
    @speed = 0
  end

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @speed == 0 ? @wagon_amount += 1 : (puts "Поезд движется. Это невозможно")
    end

  def delete_wagon
    @speed == 0 ? @wagon_amount -= 1 : (puts "Поезд движется. Это невозможно")
  end

  def add_route(route)
    @route = route
    @current_station = @route[0]
  end

  def move_to_next_station
    @current_station == @route[-1] ? (puts "Эта станция конечная") : @current_station = @route[find_index + 1]
  end

  def move_to_previous_station
    @current_station == @route[0] ? (puts "Эта станция начальная") : @current_station = @route[find_index - 1]
  end

  def show_next_station
    @current_station == @route[-1] ? (puts "Эта станция конечная") : @route[find_index + 1]
  end

  def show_previous_station
    @current_station == @route[0] ? (puts "Эта станция начальная") : @route[find_index - 1]
  end
  
  private
  
  def find_index
    @route.index(@current_station)
  end
end
