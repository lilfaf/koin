module Koin
  module Persistence
    class << self

      def access_token=(token)
        redis_conn { |conn| conn.set 'access_token', token }
      end

      def access_token
        redis_conn { |conn| conn.get 'access_token' }
      end

      def expires=(time)
        redis_conn { |conn| conn.set 'expires', time }
      end

      def expires
        redis_conn { |conn| conn.get 'expires' }
      end

      def last_lookup
        redis_conn { |conn| conn.get('last_lookup') }.to_i
      end

      def last_lookup=(time)
        redis_conn { |conn| conn.set('last_lookup', time.to_i) }
      end

      def clear
        redis_conn { |conn| conn.del 'access_token', 'expires', 'seen', 'last_lookup' }
      end

      def seen?(url)
        redis_conn { |conn| conn.sismember('seen', url) }
      end

      def mark(url)
        redis_conn { |conn| conn.sadd('seen', url) }
      end

      def redis_conn
        Sidekiq.redis do |conn|
          yield conn
        end
      end
    end
  end
end
