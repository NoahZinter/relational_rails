# frozen_string_literal: true

class AddDealershipToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :dealership, foreign_key: true
  end
end
