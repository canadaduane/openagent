$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'lib'))

require 'sif/sif'

def fixture(file)
  File.join(File.dirname(__FILE__), '..', '..', 'fixtures', file)
end