require "net/https"
require "virtus"

module OpenAgent
  class SSLConfig
    include Virtus.model

    attribute :verify_mode, Integer, :default => OpenSSL::SSL::VERIFY_NONE
    attribute :client_cert
    attribute :client_key
    attribute :ca_file

    def configure(conn)
      conn.use_ssl = true
      conn.verify_mode = verify_mode

      conn.cert    = client_cert if client_cert
      conn.key     = client_key  if client_key
      conn.ca_file = ca_file     if ca_file
    end

    def cert_key
      "#{client_cert} #{client_key}"
    end
  end
end