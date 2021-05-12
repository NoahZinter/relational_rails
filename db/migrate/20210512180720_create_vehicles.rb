class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :manufacturer_id
      t.string :name
      t.integer :year
      t.integer :price
      t.boolean :sold
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
