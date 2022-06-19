require './modules/instance_сounter.rb' 

class Route
  include InstanceCounter
  attr_reader :number, :stations

  @@routes_list = []

  def self.all
    @@routes_list
  end

  def initialize(number, start_station, finish_station)
    @number = number
    @stations = []
    @stations << start_station
    @stations << finish_station
    @@routes_list << self

    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_all_stations
    @stations.each { |station| print "#{station.name}, " }
  end
end
