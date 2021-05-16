class Vehicle < ApplicationRecord
  belongs_to :manufacturer

  def alphabetize
    Vehicle.order(:name)
  end
end
