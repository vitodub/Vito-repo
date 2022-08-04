# frozen_string_literal: true

class CargoTrain < Train
  NUMBER_FORMAT = /^[a-z0-9]{3}(-| )[a-z0-9]{2}$/i.freeze
  
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super
    validate!
    @type = 'Грузовой'
  end

  def add_wagon(wagon)
    wagon.type == 'Грузовой' ? super : (puts 'Вагон не грузовой')
  end

  def delete_wagon(wagon)
    wagon.type == 'Грузовой' ? super : (puts 'Вагон не грузовой')
  end
end
