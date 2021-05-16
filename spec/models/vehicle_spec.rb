require 'rails_helper'

RSpec.describe Vehicle do
  it {should belong_to :manufacturer}
  describe 'Instance methods' do
    describe '#alphabetize' do
      it 'sorts vehicles by name' do
      end
    end
  end
end