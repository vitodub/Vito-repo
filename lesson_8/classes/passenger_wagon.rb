class PassengerWagon < Wagon

  attr_reader :seats, :o_seats
  
  def initialize(seats)
    @seats = seats
    @o_seats = 0
    self.set_type("Пассажирский")
    @@wagons_list << self
  end

  def occupy
    if @o_seats != @seats 
      @o_seats += 1
      puts "В вагоне занято одно место"

    else 
      puts "Все места заняты"
    end
  end

  def free_seats
    @seats - @o_seats
  end 
end
