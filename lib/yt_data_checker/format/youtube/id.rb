module YtDataChecker
  module Format
    module Youtube
      class Id
        # Possible values
        # UC is optional, will need to strip UC from beginning if present
        # can be a url anything after '/' will be the id
        # a valid youtube id is 22 characters in length
        # assume that if the id is 22 characters then return
        class << self
          def run(id)
            return id if id.length == 22
            case id.length
            when 24 then remove_uc(id)
            else parse_url(id)
            end
          end

          def remove_uc(id)
            id[2..-1] if id[0..1] == 'UC'
          end

          def parse_url(url)
            url.match(%r{/channel/UC(.+)$})[1]
          end
        end
      end
    end
  end
end
