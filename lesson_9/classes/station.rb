# frozen_string_literal: true

require_relative '/home/sgp/Документы/ROR/Lesson_9/modules/instance_сounter'
require_relative '/home/sgp/Документы/ROR/Lesson_9/modules/validation'

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
    @trains.count { |t| t.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train(&block)
    @trains.each(&block)
  end

  private

  def validate!
    raise 'Название не может быть пустым' if @name.length < 2
  end
end
