# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vehicle.destroy_all
Manufacturer.destroy_all
Employee.destroy_all
Dealership.destroy_all

honda = Manufacturer.create!(name: 'Honda', production_capacity: 200, is_open: true)
ford = Manufacturer.create!(name: 'Ford', production_capacity: 300, is_open: false)
ferrari = Manufacturer.create!(name: 'Ferrari', production_capacity: 50, is_open: true)

honda.vehicles.create!(name: 'Civic', year: 2000, price: 2500, sold: false)
honda.vehicles.create!(name: 'CRV', year: 2002, price: 3500, sold: false)

ford.vehicles.create!(name: 'F-150', year: 1996, price: 4000, sold: true)
ford.vehicles.create!(name: 'Mustang', year: 2012, price: 8000, sold: false)

ferrari.vehicles.create!(name: 'Scuderia', year: 2018, price: 41_000, sold: false)
ferrari.vehicles.create!(name: 'Fasterosa', year: 2002, price: 45_000, sold: false)

rex = Dealership.create!(name: 'Rex Cars', is_open: false, max_car_capacity: 214, is_full: false)
harrison = Dealership.create!(name: 'Harrison Ford', is_open: true, max_car_capacity: 352, is_full: true)
ted = Dealership.create!(name: "Ted's Auto", is_open: true, max_car_capacity: 143, is_full: false)

rex.employees.create!(name: 'Earl Leiberd', cars_sold: 23, on_vacation: false)
rex.employees.create!(name: 'Anita Nappe', cars_sold: 98, on_vacation: true)

harrison.employees.create!(name: 'Al E. Gator', cars_sold: 74, on_vacation: false)
harrison.employees.create!(name: 'Don Keigh', cars_sold: 62, on_vacation: false)
harrison.employees.create!(name: 'Sarha Nader', cars_sold: 86, on_vacation: true)

ted.employees.create!(name: 'Emma Nate', cars_sold: 52, on_vacation: true)
ted.employees.create!(name: 'Max E. Mumm', cars_sold: 127, on_vacation: false)
ted.employees.create!(name: 'Lois Price', cars_sold: 98, on_vacation: false)
