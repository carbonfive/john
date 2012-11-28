require 'spec_helper'

describe "queue" do
  before do
    $current_queue.clear
  end

  describe '#get' do
    it 'lists the current people in the line' do
      names = Faker::Lorem.words(4)
      $current_queue = names

      get '/queue'

      expect(last_response.status).to eq 200

      names.each do |name|
        expect(last_response.body).to match(/#{name}/)
      end
    end
  end

  describe '#post' do
    it 'adds a person to the line' do
      name = Faker::Name.first_name
      post '/queue', :name => name

      expect($current_queue.last).to eq name
      expect(last_response.status).to eq 201
    end
  end
end
