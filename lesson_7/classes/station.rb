require_relative '../modules/instance_сounter.rb' 
require_relative '../modules/validation.rb' 

class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@stations_list = []

  def self.all
    @@stations_list
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations_list << self
    validate!
    register_instance
  end

  def accept_train(train)
    @trains << train
  end

  def show_train_types(type)
    amount_of_trains = @trains.count { |t| t.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  private
  def validate! 
    raise "Название не может быть пустым" if @name.length < 2
  end
end
