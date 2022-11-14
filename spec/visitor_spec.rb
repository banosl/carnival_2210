require './lib/visitor'
require 'pry'

RSpec.describe Visitor do
  it 'visitor exists and has attributes' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_instance_of(Visitor)
    expect(visitor1.name).to eq('Bruce')
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
  end


end