require './modules/manufacturer.rb' 

class Wagon
  include Manufacturer # подключили модуль указания/получения компании-изготовителя
  attr_reader :type

  def initialize
    set_type
  end

  protected

  attr_writer :type

  def set_type
    self.type = type
  end
end
