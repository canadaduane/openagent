require 'virtus'

%w(
  term_span
).each do |c|
  require "sif/models/groups/data_model/#{c}"
end