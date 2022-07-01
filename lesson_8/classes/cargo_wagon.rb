class CargoWagon < Wagon
  attr_reader :volume, :o_volume, :free_volume
  
  def initialize(volume)
    @volume = volume
    @o_volume = 0
    self.set_type("Грузовой")
    @@wagons_list << self
  end

  def occupy(volume)
    if @o_volume <= @volume
      @o_volume += volume
      puts "В вагоне занят объём #{volume}" 

    else
      puts "Весь объём занят"
    end
  end

  def free_volume
    @volume - @o_volume
  end 
end

