require 'virtus'

module OpenAgent
  class Agent
    include Virtus.model

    attribute :name,            String
    attribute :source_id,       String,  :default => :name
    attribute :version,         String,  :default => "2.0r1"
    attribute :max_buffer_size, Integer, :default => 128_000
    attribute :mode,            String,  :default => "Pull"
    attribute :msg_version,     String,  :default => :version
    attribute :msg_xmlns,       String,  :default => "http://www.sifinfo.org/infrastructure/2.x"

    attribute :provide,         Array[String]
    attribute :subscribe,       Array[String]
    attribute :publish_add,     Array[String]
    attribute :publish_change,  Array[String]
    attribute :publish_delete,  Array[String]
    attribute :request,         Array[String]
    attribute :respond,         Array[String]
    attribute :conditions,      Hash

  end
end