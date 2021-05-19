# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :manufacturer

  def self.unsold
    where('sold = false')
  end
end
