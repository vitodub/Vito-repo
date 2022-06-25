class PassengerTrain < Train
  def initialize(number)
    super
    @type = "passenger"
  end

  def add_wagon(wagon)
    wagon.type == "passenger" ? super : (puts "Вагон не пассажирский")

  end

  def delete_wagon(wagon)
    wagon.type == "passenger" ? super : (puts "Вагон не пассажирский")
  end
end
