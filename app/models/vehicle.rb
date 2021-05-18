# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :manufacturer

  self.default_scopes = []
  default_scopes {}

  def self.unsold
    where('sold = false')
  end
end
