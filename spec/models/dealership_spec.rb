require 'rails_helper'

RSpec.describe Dealership do
  it {should have_many :employees}

  describe 'instance methods' do
    describe '#employee_count' do
      it 'counts total vehicles of a manufacturer' do
        rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)
        rex.employees.create!(name:"Earl Leiberd", cars_sold:23, on_vacation: false)
        rex.employees.create!(name:"Anita Nappe", cars_sold:98, on_vacation: true)

        expect(rex.employee_count).to eq 2
      end
    end

    describe '#order_by_created_at' do
      it 'orders dealerships by their creation times' do
        rex = Dealership.create!(name:"Rex Cars", is_open: false, max_car_capacity: 214, is_full: false)
        harrison = Dealership.create!(name:"Harrison Ford", is_open: true, max_car_capacity: 352, is_full: true)
        ted = Dealership.create!(name:"Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

        expect(Dealership.default_scope).to eq ([ted, harrison, rex])
      end
    end
  end
end
