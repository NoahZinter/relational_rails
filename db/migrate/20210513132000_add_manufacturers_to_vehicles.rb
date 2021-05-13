class AddManufacturersToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :manufacturer, foreign_key: true
  end
end
