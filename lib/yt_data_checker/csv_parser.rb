require 'csv'
require 'yt_data_checker/format/youtube/id'
require 'yt_data_checker/format/youtube/subscriber_count'

module YtDataChecker
  class CSVParser
    # assuming that all files contains the same header row
    def self.run(file)
      output = {}
      raw_file = CSV.open(file, 'r')
      raw_file.each_with_index do |row, index|
        next if index.zero? && row[0] == 'Account Email'
        output[row[0]] = { channel_ownership: YtDataChecker::Format::Youtube::Id.run(row[1]),
                           subscriber_count: YtDataChecker::Format::Youtube::SubscriberCount.run(row[2]) }
      end
      output
    end
  end
end
