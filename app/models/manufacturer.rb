class Manufacturer < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  def vehicle_count
    vehicles.count
  end

  def self.default_scope
    order("created_at DESC")
  end

  def alphabetize
    vehicles.order(:name)
  end

  def over_price(limit)
    vehicles.where("price > #{limit}")
  end

  def under_price(limit)
    vehicles.where("price < #{limit}")
  end
end
