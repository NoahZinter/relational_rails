class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.boolean :is_open
      t.integer :max_car_capacity
      t.boolean :is_full

      t.timestamps
    end
  end
end
