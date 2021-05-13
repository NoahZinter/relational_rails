class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :price
      t.integer :year
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :sold
    end
  end
end
