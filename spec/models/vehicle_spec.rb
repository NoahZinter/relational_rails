require 'rails_helper'

RSpec.describe Vehicle do
  it {should belong_to :manufacturer}
end