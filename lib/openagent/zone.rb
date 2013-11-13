require "net/http"
require "uri"

require_relative "ssl_config"

require "virtus"

module OpenAgent
  class Zone
    include Virtus.model

    attribute :uri
    attribute :timeout,      Float, :default => 60
    attribute :open_timeout, Float, :default => 30
    attribute :ssl, SSLConfig
  
    def url
      @url ||= URI.parse(uri)
    end

    def connection
      @connection ||= Net::HTTP.new(url.host, url.port).tap do |conn|
        ssl.configure(conn) if ssl
        conn.read_timeout = timeout if timeout
        conn.open_timeout = open_timeout if open_timeout
      end
    end

    def create_request(msg)
      Net::HTTP::Post.new(url.path).tap do |post|
        post.body = msg.to_s
        post.content_type = "application/xml"
      end
    end

    def send_request(request)
      connection.request(request)
    end

    def send_message(msg)
      send_request(create_request(msg))
    end
  end
end
