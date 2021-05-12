class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :manufacturer_id
      t.string :name
      t.boolean :sold
      t.integer :price
      t.timestamps
    end
  end
end
