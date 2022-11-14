require './lib/carnival'
require './lib/ride'
require './lib/visitor'
require 'pry'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new('Frozen Dead Guy Days', '5 days')
  end

  it 'carnival exists and has attributes' do
    expect(@carnival).to be_instance_of(Carnival)
    expect(@carnival.name).to eq('Frozen Dead Guy Days')
    expect(@carnival.duration).to eq('5 days')
    expect(@carnival.rides).to eq([])
  end
  describe 'carnival with rides and visitors on rides' do
    before(:each) do
      @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      @visitor1 = Visitor.new('Bruce', 54, '$10')
      @visitor2 = Visitor.new('Tucker', 36, '$5')
      @visitor3 = Visitor.new('Penny', 64, '$15')
      @visitor4 = Visitor.new('Marco', 70, '$20')
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor3.add_preference(:gentle)
      @visitor4.add_preference(:gentle)
      @visitor2.add_preference(:thrilling)
      @visitor3.add_preference(:thrilling)
      @visitor4.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
      @ride2.board_rider(@visitor2)
      @ride2.board_rider(@visitor3)
      @ride2.board_rider(@visitor4)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor4)
      @ride3.board_rider(@visitor4)
      @ride3.board_rider(@visitor4)
      @ride3.board_rider(@visitor4)
    end

    it 'carnival can add and list out its rides' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end

    describe 'carnival with rides added' do
      before(:each) do
        @carnival.add_ride(@ride1)
        @carnival.add_ride(@ride2)
        @carnival.add_ride(@ride3)
      end

      it 'carnival can tell us its most popular ride' do
        # binding.pry
        expect(@carnival.most_popular_ride).to eq(@ride3)
      end

      it 'carnival can tell us its most profitable ride' do
        # binding.pry
        expect(@carnival.most_profitable_ride).to eq(@ride2)
      end
    end
  end
end
