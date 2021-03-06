require 'nori'
require 'memoist'
require 'faraday'
require 'active_support/time'

module EveOnline
  module XML
    class Base
      extend Memoist

      attr_reader :parser

      def initialize
        @parser = Nori.new(advanced_typecasting: false)
      end

      def url
        raise NotImplementedError
      end

      def user_agent
        "EveOnline API (https://github.com/biow0lf/eve_online) v#{ VERSION }"
      end

      def content
        faraday = Faraday.new

        faraday.headers[:user_agent] = user_agent
        faraday.options.timeout = 60
        faraday.options.open_timeout = 60

        resource = faraday.get(url)

        case resource.status
        when 200
          resource.body
        when 400
          raise EveOnline::Exceptions::InvalidCharacterIDException
        when 403
          raise EveOnline::Exceptions::UnauthorizedException
        end
      rescue Faraday::TimeoutError
        raise EveOnline::Exceptions::TimeoutException
      end
      memoize :content

      def response
        parser.parse(content)
      end
      memoize :response

      def eveapi
        response.fetch('eveapi')
      end
      memoize :eveapi

      def result
        eveapi.fetch('result')
      end
      memoize :result

      def cached_until
        parse_datetime_with_timezone(eveapi.fetch('cachedUntil'))
      end
      memoize :cached_until

      def current_time
        parse_datetime_with_timezone(eveapi.fetch('currentTime'))
      end
      memoize :current_time

      def version
        eveapi.fetch('@version').to_i
      end
      memoize :version

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone['UTC'].parse(value)
      end
    end
  end
end
