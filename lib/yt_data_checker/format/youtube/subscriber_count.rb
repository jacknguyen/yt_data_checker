module YtDataChecker
  module Format
    module Youtube
      class SubscriberCount
        def self.run(count)
          count.to_s.delete(',').to_i
        end
      end
    end
  end
end
