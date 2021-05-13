# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

honda = Manufacturer.create!(name:"Honda", production_capacity:200, is_open:true)
ford = Manufacturer.create!(name:"Ford", production_capacity:300, is_open:false)
ferrari = Manufacturer.create!(name:"Ferrari", production_capacity:50, is_open:true)

honda.vehicles.create!(name:"Civic", year:2000, price:2500, sold:false)
honda.vehicles.create!(name:"CRV", year:2002, price:3500, sold:false)

ford.vehicles.create!(name:"F-150", year:1996, price:4000, sold:true)
ford.vehicles.create!(name:"Mustang", year:2012, price:8000, sold:false)

ferrari.vehicles.create!(name:"Scuderia", year:2018, price:41000, sold:false)
ferrari.vehicles.create!(name:"Fasterosa", year:2002, price:45000, sold:false)
