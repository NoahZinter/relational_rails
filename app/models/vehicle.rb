class Vehicle < ApplicationRecord
  belongs_to :manufacturer

  def self.unsold
    self.where("sold = false")
  end
end
