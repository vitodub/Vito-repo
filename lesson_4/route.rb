class Route

  attr_reader :number, :stations

  def initialize(number, start_station, finish_station)
    @number = number
    @stations = []
    @stations << start_station
    @stations << finish_station
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
