require 'sif/models/groups/sis'
require 'sif/models/groups/data_model'

%w(
  data_model
  sis
).each do |c|
  require "sif/models/groups/#{c}"
end

require 'virtus'
