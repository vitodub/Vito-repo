# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :volume, :o_volume

  # убрал :free_volume

  def initialize(volume)
    super
    @volume = volume
    @o_volume = 0
    type('Грузовой')
  end

  def occupy(volume)
    if @o_volume <= @volume
      @o_volume += volume
      puts "В вагоне занят объём #{volume}"

    else
      puts 'Весь объём занят'
    end
  end

  def free_volume
    @volume - @o_volume
  end
end
