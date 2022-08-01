# frozen_string_literal: true

require './modules/manufacturer'
require './modules/acсessors'

class Wagon
  include Manufacturer
  attr_reader :type

  @@wagons_list = []

  def self.all
    @@wagons_list
    # убрал type
  end

  def initialize
    @@wagons_list << self
  end

  protected

  attr_writer :type
end
