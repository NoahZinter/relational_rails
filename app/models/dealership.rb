class Dealership < ApplicationRecord
  has_many :employees

  def employee_count
    employees.count
  end

  def self.default_scope
    order("created_at DESC")
  end
end
