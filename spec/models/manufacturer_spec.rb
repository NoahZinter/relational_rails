require 'rails_helper'

RSpec.describe Manufacturer do
  it {should have_many :vehicles}
end