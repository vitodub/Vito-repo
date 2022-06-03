class Wagon
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
