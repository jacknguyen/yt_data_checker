require 'yt_data_checker/format/youtube/id'

describe YtDataChecker::Format::Youtube::Id do
  subject(:youtube_id) { YtDataChecker::Format::Youtube::Id.run id }

  before :each do
    @valid_youtube_id = (0...22).map { (65 + rand(26)).chr }.join
  end

  describe '#run' do
    context 'given a valid id' do
      let(:id) { @valid_youtube_id }
      it { expect(youtube_id).to eql @valid_youtube_id }
    end

    context 'given an id with UC' do
      let(:id) { 'UC' + @valid_youtube_id }
      it { expect(youtube_id).to eql @valid_youtube_id }
    end

    context 'given a url' do
      let(:id) { 'www.youtube.com/channel/UC' + @valid_youtube_id }
      it { expect(youtube_id).to eql @valid_youtube_id }
    end
  end
end
