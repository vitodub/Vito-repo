# frozen_string_literal: true

class PassengerTrain < Train
  
  NUMBER_FORMAT = /^[a-z0-9]{3}(-| )[a-z0-9]{2}$/i.freeze
  
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  
  def initialize(number)
    super
    validate!
    @type = 'Пассажирский'
  end

  def add_wagon(wagon)
    wagon.type == 'Пассажирский' ? super : (puts 'Вагон не пассажирский')
  end

  def delete_wagon(wagon)
    wagon.type == 'Пассажирский' ? super : (puts 'Вагон не пассажирский')
  end
end
