require 'spec_helper'

describe Bathroom do
  describe '.occupied?' do
    subject { described_class.new }

    context 'given the bathroom is occupied', :vcr do
      it 'returns true' do
        expect(subject).to be_occupied
      end
    end

    context 'given the bathroom is not occupied', :vcr do
      it 'returns false' do
        expect(subject).to_not be_occupied
      end
    end
  end

  context "caching" do
    let(:redis) { Redis.new }
    let(:cache) { Cache.wrap(redis) }

    subject { described_class.new(cache) }

    before do
      cache.flush
    end

    it "calls the API when the cache is cold" do
      expect_any_instance_of(Bathroom::StatusApiCall).to receive(:perform)
      subject.occupied?
    end

    it "does not call the API when cache is still valid" do
      expect_any_instance_of(Bathroom::StatusApiCall).to receive(:perform).at_most(:once).and_return(true)
      subject.occupied?
      subject.occupied?
    end
  end
end
