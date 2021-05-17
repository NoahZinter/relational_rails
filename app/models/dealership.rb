class Dealership < ApplicationRecord
  has_many :employees, dependent: :destroy

  def employee_count
    employees.count
  end

  def self.default_scope
    order("created_at DESC")
  end

  def alphabetize
    employees.order(:name)
  end
end
