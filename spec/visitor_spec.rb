require './lib/visitor'
require 'pry'

RSpec.describe Visitor do
  it 'visitor exists and has attributes' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_instance_of(Visitor)
    expect(visitor1.name).to eq('Bruce')
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
  end

  it 'visitor gains preferences with #add_preference' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.preferences).to eq([])

    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)

    expect(visitor1.preferences).to eq([:gentle, :water])

  end


end