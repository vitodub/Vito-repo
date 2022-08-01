# frozen_string_literal: true

require_relative './modules/instance_сounter' 
require_relative './modules/validation'
require_relative './modules/manufacturer'
require_relative './modules/acсessors'

class Train
  NUMBER_FORMAT = /^[a-z0-9]{3}(-| )[a-z0-9]{2}$/i.freeze

  include InstanceCounter
  include Manufacturer
  include Validation
  attr_reader :type, :speed, :current_station, :wagons, :number, :route

  @@trains_list = []

  # block = ->(wagon) { return wagon }

  def self.find(number)
    @trains_list.find { |train| train.number == number }
  end

  def self.all
    @trains_list
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @route
    @current_station
    @type
    validate!
    @trains_list << self
    register_instance
  end

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    @speed.zero? ? @wagons << wagon : (puts 'Поезд движется. Это невозможно')
  end

  def delete_wagon
    @speed.zero? ? @wagons.pop : (puts 'Поезд движется. Это невозможно')
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations[0]
    @route.stations[0].trains << self
  end

  # убрал тернарные операторы из-за чрезмерной длины строки
  def move_to_next_station
    if @current_station == @route.stations.last
      puts 'Эта станция конечная'
    else
      @current_station = @route.stations[find_index + 1]
    end
  end

  def move_to_previous_station
    if @current_station == @route.stations.first
      puts 'Эта станция начальная'
    else
      @current_station = @route.stations[find_index - 1]
    end
  end

  def show_next_station
    if @current_station == @route.stations.last
      puts 'Эта станция конечная'
    else
      @route.stations[find_index + 1]
    end
  end

  def show_previous_station
    if @current_station == @route.stations.first
      puts 'Эта станция начальная'
    else
      @route.stations[find_index - 1]
    end
  end

  def each_wagon(&block)
    @wagons.each(&block)
  end

  private

  def find_index
    @route.stations.index(@current_station)
  end

  def validate!
    raise 'Номер не соответствует формату' if @number !~ NUMBER_FORMAT
  end
end
