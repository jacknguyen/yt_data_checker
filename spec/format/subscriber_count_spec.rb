require 'yt_data_checker/format/youtube/subscriber_count'

describe YtDataChecker::Format::Youtube::SubscriberCount do
  subject(:subscriber_count) { YtDataChecker::Format::Youtube::SubscriberCount.run num }

  describe '#run' do
    context 'given a string' do
      let(:num) { '1200' }
      it { expect(subscriber_count).to eql 1200 }
    end

    context 'given a string with a comma' do
      let(:num) { '1,200' }
      it { expect(subscriber_count).to eql 1200 }
    end

    context 'given an int' do
      let(:num) { 1200 }
      it { expect(subscriber_count).to eql 1200 }
    end
  end
end
