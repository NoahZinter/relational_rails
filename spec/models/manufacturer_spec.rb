require 'rails_helper'

RSpec.describe Manufacturer do
  it {should have_many :vehicles}

  describe 'instance methods' do
    describe '#vehicle_count' do
      it 'counts total vehicles of a manufacturer' do
        chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
        chevy.vehicles.create!(name:"Cruz", year:2000, price:2500, sold:false)
        chevy.vehicles.create!(name:"Silverado", year:2005, price:4500, sold:true)

        expect(chevy.vehicle_count).to eq 2
      end
    end

    describe '#order_by_created_at' do
      it 'orders manufacturers by their creation times' do
        chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
        zonda = Manufacturer.create!(name:"Zonda", production_capacity:80, is_open:true)
        ford = Manufacturer.create!(name:"Ford", production_capacity:50, is_open:true)

        expect(Manufacturer.default_scope).to eq ([ford, zonda, chevy])
      end
    end

    describe '.alphabetize' do
      it 'orders vehicles by name' do
        honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
        honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: true)
        honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: true)
        honda.vehicles.create!(name:"Accord", year:2000, price:2500, sold: false)
        honda.vehicles.create!(name:"Del Sol", year:2005, price:4500, sold: true)

        alphabetized = honda.alphabetize

        expect(alphabetized.first.name).to eq 'Accord'
        expect(alphabetized.last.name).to eq "Del Sol"
      end
    end
  end
end