class Carnival
  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def most_popular_ride
    popular = @rides.sort_by do |ride|
      ride.total_rides
    end
    popular.last
  end

  def most_profitable_ride
    profitable = @rides.sort_by do |ride|
      ride.total_revenue
    end
    profitable.last
  end

  def total_revenue
    total = 0
    @rides.each do |ride|
      total += ride.total_revenue
    end
    total
  end
end
