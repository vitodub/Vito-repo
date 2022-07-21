# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :seats, :o_seats

  def initialize(seats)
    super
    @seats = seats
    @o_seats = 0
    set_type('Пассажирский')
  end

  def occupy
    if @o_seats != @seats
      @o_seats += 1
      puts 'В вагоне занято одно место'

    else
      puts 'Все места заняты'
    end
  end

  def free_seats
    @seats - @o_seats
  end
end
