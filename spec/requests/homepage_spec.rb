require 'spec_helper'

describe 'The homepage' do
  before do
    get '/'
  end

  it 'displays the bathroom' do
    expect(last_response).to have_selector('#bathroom')
  end
end
