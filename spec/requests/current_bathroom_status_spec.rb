require 'spec_helper'

describe 'Given the bathroom is occupied', :vcr do
  context 'When I ask for the current bathroom state' do
    before do
      get '/bathroom'
    end

    it 'says it is occupied' do
      json = JSON last_response.body
      expect(json['occupied']).to be_true
    end
  end
end

describe 'Given the bathroom is not occupied', :vcr do
  context 'When I ask for the current bathroom state' do
    before do
      get '/bathroom'
    end

    it 'says it is not occupied' do
      json = JSON last_response.body
      expect(json['occupied']).to be_false
    end
  end
end
