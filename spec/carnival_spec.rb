require './lib/carnival'
require './lib/ride'
require './lib/visitor'
require 'pry'

RSpec.describe Carnival do
  it 'carnival exists and has attributes' do
    carnival = Carnival.new("5 days")

    expect(carnival).to be_instance_of(Carnival)
    expect(carnival.duration).to eq("5 days")
    expect(carnival.rides).to eq([])
  end
end