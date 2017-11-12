require 'yt_data_checker/csv_parser'
require 'csv'

module YtDataChecker
  class Validate
    attr_accessor :discrepancies

    def initialize(file1, file2, opts = {})
      @first_file = file1
      @second_file = file2
      @discrepancies = []
      @concern = opts[:concern] ? [opts[:concern]] : %i[channel_ownership subscriber_count]
    end

    def run
      data_set1 = YtDataChecker::CSVParser.run(first_file)
      data_set2 = YtDataChecker::CSVParser.run(second_file)
      data_set1.each do |key, value|
        next if select_concern(value) == select_concern(data_set2[key])
        discrepancies << key
      end
      puts discrepancies.join("\n")
    end

    private

    def select_concern(value)
      value.select { |x| concern.include?(x) }.values
    end

    attr_reader :first_file, :second_file, :concern
  end
end
