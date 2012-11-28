require 'spec_helper'

describe Bathroom do
  describe '.occupied?' do
    context 'given the bathroom is occupied', :vcr do
      it 'returns true' do
        expect(Bathroom).to be_occupied
      end
    end

    context 'given the bathroom is not occupied', :vcr do
      it 'returns false' do
        expect(Bathroom).to_not be_occupied
      end
    end
  end
end
