require "net/http"
require "net/https"
require "uri"

require "openagent/utils/assign_variables"

module OpenAgent
  class Zone
    include AssignVariables
    attr_accessor :uri, :use_ssl, :verify_ssl, :verify_mode
    attr_accessor :ssl_client_cert, :ssl_client_key, :ssl_ca_file
    attr_accessor :timeout, :open_timeout, :verbose
  
    def initialize(opts)
      assign_variables(%w(uri use_ssl verify_ssl verify_mode
         ssl_client_cert ssl_client_key ssl_ca_file
         open_timeout timeout verbose), opts)
    end

    def self.from_yaml(filename)
      Zone.new(YAML::load(File.open("#{filename}")))
    end

    def url
      @url ||= URI.parse(uri)
    end

    def connection
      @connection ||= Net::HTTP.new(url.host, url.port).tap do |conn|
        conn.use_ssl = use_ssl
        conn.verify_mode = OpenSSL::SSL::VERIFY_NONE if use_ssl

        conn.cert = ssl_client_cert if ssl_client_cert
        conn.key = ssl_client_key if ssl_client_key
        conn.ca_file = ssl_ca_file if ssl_ca_file
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
