require 'uuid'
require 'roxml'
require "net/http"
require "net/https"
require "uri"

require 'openagent/messages'
require 'openagent/zone'
require 'openagent/agent'
require 'openagent/activity'


SIF_MODEL = SIF::Model::Common
SIF_XML = SIF::Representation::XML

module OpenAgent
end