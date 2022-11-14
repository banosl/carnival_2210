class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :ride_log
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @ride_log = {}
  end

  def board_rider(visitor)
    if !ride_log.include?(visitor) && visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
      ride_log[visitor] = 0
      ride_log[visitor] += 1
      visitor.spend(admission_fee)
      @total_revenue += @admission_fee
    elsif ride_log.include?(visitor)
      ride_log[visitor] += 1
      visitor.spend(admission_fee)
      @total_revenue += @admission_fee
    end
  end
end
