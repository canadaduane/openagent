$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'lib'))

require 'representable'
require 'representable/xml'

require 'sif/messages'
require 'sif/models'
require 'sif/representations/xml'

def fixture(file)
  File.join(File.dirname(__FILE__), '..', '..', 'fixtures', file)
end