class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    @trains << train
  end

  def show_train_types(type)
    specific_trains = @trains.select { |t| t.type == type }
    amount_of_trains = @trains.count { |t| t.type == type }
    return specific_trains, amount_of_trains
  end

  def send_train(train)
    @trains.delete(train)
  end
end