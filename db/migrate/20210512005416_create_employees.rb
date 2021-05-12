class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.boolean :on_vacation
      t.integer :cars_sold

      t.timestamps
    end
  end
end
