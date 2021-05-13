# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_13_132000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.boolean "is_open"
    t.integer "max_car_capacity"
    t.boolean "is_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.boolean "on_vacation"
    t.integer "cars_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dealership_id"
    t.index ["dealership_id"], name: "index_employees_on_dealership_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.integer "production_capacity"
    t.boolean "is_open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "sold"
    t.bigint "manufacturer_id"
    t.index ["manufacturer_id"], name: "index_vehicles_on_manufacturer_id"
  end

  add_foreign_key "employees", "dealerships"
  add_foreign_key "vehicles", "manufacturers"
end
