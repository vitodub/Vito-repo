# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super
    @type = 'Пассажирский'
  end

  def add_wagon(wagon)
    wagon.type == 'Пассажирский' ? super : (puts 'Вагон не пассажирский')
  end

  def delete_wagon(wagon)
    wagon.type == 'Пассажирский' ? super : (puts 'Вагон не пассажирский')
  end
end
