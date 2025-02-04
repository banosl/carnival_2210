class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete!('$').to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences.push(preference)
  end

  def tall_enough?(height_minimum)
    @height >= height_minimum
  end

  def spend(fee)
    @spending_money -= fee
  end
end
