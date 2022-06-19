require './modules/instance_сounter.rb' 

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
end
