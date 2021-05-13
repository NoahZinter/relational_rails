require 'rails_helper'

RSpec.describe Manufacturer do
  it {should have_many :vehicles}

  describe 'instance methods' do
    describe '#vehicle_count' do
      it 'counts total vehicles of a manufacturer' do
        chevy = Manufacturer.create!(name:"Chevy", production_capacity:40, is_open:true)
        cruz = chevy.vehicles.create!(name:"Cruz", year:2000, price:2500, sold:false)
        silverado = chevy.vehicles.create!(name:"Silverado", year:2005, price:4500, sold:true)

        expect(chevy.vehicle_count).to eq 2
      end
    end
  end
end