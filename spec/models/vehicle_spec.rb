require 'rails_helper'

RSpec.describe Vehicle do
  it {should belong_to :manufacturer}

  describe 'class methods' do
    describe 'unsold' do
      it 'returns vehicles where sold is false' do
        honda = Manufacturer.create!(name:"Honda", production_capacity: 28, is_open: true)
        civic = honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold: false)
        crv = honda.vehicles.create!(name:"CRV", year:2005, price:4500, sold: true)
        accord = honda.vehicles.create!(name:"Accord", year:2000, price:2500, sold: false)
        del_sol = honda.vehicles.create!(name:"Del Sol", year:2005, price:4500, sold: true)

        expect(Vehicle.unsold).to eq([civic, accord])
      end
    end
  end
end
