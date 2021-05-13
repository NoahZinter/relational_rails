require 'rails_helper'

RSpec.describe Employee do
  it {should belong_to :dealership}
end