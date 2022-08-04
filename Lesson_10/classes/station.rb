# frozen_string_literal: true

require './modules/instance_сounter' 
require './modules/validation'
require './modules/acсessors'

class Station
  include InstanceCounter
  attr_reader :trains, :name
  
  validate :name, :presence
  validate :name, :type, String

  @@stations_list = []

  def self.all
    @@stations_list
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations_list << self    
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
