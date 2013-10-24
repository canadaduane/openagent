require 'openagent/messages/sif_header'
require 'openagent/messages/sif_ack'
require 'openagent/messages/sif_register'
require 'openagent/messages/sif_unregister'
require 'openagent/messages/sif_provision'
require 'openagent/messages/sif_controlmessage'
require 'openagent/messages/sif_event'
require 'openagent/messages/sif_request'
require 'openagent/messages/sif_response'

require 'openagent/messages/sif_message'

require 'openagent/sif'

module OpenAgent
  def self.Message(xml)
    OpenAgent::Message::SIF_Ack::SIF_Message.from_xml(xml)
  end
end