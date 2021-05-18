# frozen_string_literal: true

class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :production_capacity
      t.boolean :is_open
      t.timestamps
    end
  end
end
