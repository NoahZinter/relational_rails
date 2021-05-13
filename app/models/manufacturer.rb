class Manufacturer < ApplicationRecord
  has_many :vehicles

  def vehicle_count
    vehicles.count
  end
end
