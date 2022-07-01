require './modules/manufacturer.rb' 

class Wagon
  include Manufacturer 
  attr_reader :type
  @@wagons_list = []

  def self.all
    @@wagons_list
  end

  def initialize
    @@wagons_list << self
    set_type
  end

  protected

  attr_writer :type

  def set_type(type)
    self.type = type
  end
end
