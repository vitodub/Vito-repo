class CargoTrain < Train
  def initialize(number)
    super
    @type = "cargo"
  end

  def add_wagon(wagon)
    wagon.type == "cargo" ? super : (puts "Вагон не грузовой")
  end

  def delete_wagon(wagon)
    wagon.type == "cargo" ? super : (puts "Вагон не грузовой")
  end
end
