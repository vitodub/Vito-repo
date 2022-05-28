class Route
  def initialize(start_station,finish_station)
    @stations = []
    @stations[0] = start_station
    @stations[1] = finish_station
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_all_stations
    @stations.each { |station| puts station.name }
  end
end
