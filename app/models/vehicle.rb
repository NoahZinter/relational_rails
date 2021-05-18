class Vehicle < ApplicationRecord
  belongs_to :manufacturer

  self.default_scopes = []
  default_scopes {}

  def self.unsold
    self.where("sold = false")
  end
end
