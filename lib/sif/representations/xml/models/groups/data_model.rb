require 'sif/models'
require 'sif/representations/xml/models'
require 'sif/representations/xml/models/common'

%w(
  term_span
).each do |c|
  require "sif/representations/xml/models/groups/data_model/#{c}"
end