class Manufacturer < ApplicationRecord
  has_many :vehicles

  def vehicle_count
    vehicles.count
  end

  def self.default_scope
    order("created_at DESC")
  end
end
