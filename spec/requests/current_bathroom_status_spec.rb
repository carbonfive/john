require 'spec_helper'

describe 'Given the bathroom is occupied' do
  context 'When I go to the homepage' do
    before do
      get '/'
    end

    it 'Then I should see that the bathroom is occupied' do
      expect(page).to have_css('.occupied')
    end
  end
end
