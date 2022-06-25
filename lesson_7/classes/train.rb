require '/home/vit/Документы/ROR/Lesson_6(7)/modules/instance_сounter.rb' 
require '/home/vit/Документы/ROR/Lesson_6(7)/modules/manufacturer.rb' 
require '/home/vit/Документы/ROR/Lesson_6(7)/modules/validation.rb' 

class Train
  NUMBER_FORMAT = /^[a-z0-9]{3}(-| )[a-z0-9]{2}$/i

  include InstanceCounter
  include Manufacturer
  include Validation
  attr_reader :type, :speed, :current_station, :wagons, :number, :route
  @@trains_list = []

  def self.find(number)
    @@trains_list.find { |train| train.number == number }
  end

  def self.all
    @@trains_list
  end

  def initialize(number) 
    @number = number 
    @wagons = []
    @speed = 0
    @route
    @current_station
    @type 
    validate!   
    @@trains_list << self    
    register_instance
  end

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    @speed == 0 ? @wagons << wagon : (puts "Поезд движется. Это невозможно")
    end

  def delete_wagon
    @speed == 0 ? @wagons.pop : (puts "Поезд движется. Это невозможно")
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations[0]
  end

  def move_to_next_station
    @current_station == @route.stations[-1] ? (puts "Эта станция конечная") : @current_station = @route.stations[find_index + 1]
  end

  def move_to_previous_station
    @current_station == @route.stations[0] ? (puts "Эта станция начальная") : @current_station = @route.stations[find_index - 1]
  end

  def show_next_station
    @current_station == @route.stations[-1] ? (puts "Эта станция конечная") : @route.stations[find_index + 1]
  end

  def show_previous_station
    @current_station == @route.stations[0] ? (puts "Эта станция начальная") : @route.stations[find_index - 1]
  end

  private

  def find_index
    @route.stations.index(@current_station)
  end

  def validate!
    raise "Номер не соответствует формату" if @number !~ NUMBER_FORMAT
  end

end
