class CargoTrain < Train
  def initialize(number)
    super
    @type = "Грузовой"
  end

  def add_wagon(wagon)
    wagon.type == "Грузовой" ? super : (puts "Вагон не грузовой")
  end

  def delete_wagon(wagon)
    wagon.type == "Грузовой" ? super : (puts "Вагон не грузовой")
  end
end
