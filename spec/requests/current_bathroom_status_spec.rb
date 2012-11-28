require 'spec_helper'

describe 'Given the bathroom is occupied', :vcr do
  context 'When I go to the homepage' do
    before do
      get '/'
    end

    it 'Then I should see that the bathroom is occupied' do
      expect(last_response).to have_selector('.occupied')
    end
  end
end

describe 'Given the bathroom is not occupied', :vcr do
  context 'When I go to the homepage' do
    before do
      get '/'
    end

    it 'Then I should see that the bathroom is not occupied' do
      expect(last_response).to have_selector('.not-occupied')
    end
  end
end
