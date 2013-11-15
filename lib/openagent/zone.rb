require "net/http"
require "net/https"
require "uuid"
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
  
    def connection
      @connection ||= Net::HTTP.new(host, port).tap do |conn|
        ssl.configure(conn) if ssl
        conn.read_timeout = timeout if timeout
        conn.open_timeout = open_timeout if open_timeout
      end
    end

    def url
      @url ||= URI.parse(uri)
    end

    def host
      url.host
    end

    def port
      url.port
    end

    def path
      url.path == "" ? "/" : url.path
    end

    def create_request(msg)
      Net::HTTP::Post.new(path).tap do |post|
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
