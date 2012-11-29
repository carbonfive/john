require 'spec_helper'

describe Bathroom do
  describe '.to_json', :vcr do
    before do
      @to_json = Bathroom.to_json
    end

    it 'includes its occupied status' do
      json = JSON @to_json
      json.should include('occupied')
      json['occupied'].should be_true
    end
  end
end
