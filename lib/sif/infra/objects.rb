require 'virtus'

require 'sif/infra/common'

%w(
  agent_acl
  zone_status
).each do |c|
  require "sif/infra/objects/#{c}"
end
