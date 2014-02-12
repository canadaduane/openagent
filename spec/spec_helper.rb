require "webmock/rspec"
require "logger"
require "stringio"

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

def fixture(file)
  File.join(File.dirname(__FILE__), 'fixtures', file)
end

class EmptyLogger < StringIO
  def write(input)
    # do nothing
  end
end
