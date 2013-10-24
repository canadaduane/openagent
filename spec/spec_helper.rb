require "webmock/rspec"

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

def fixture(file)
  File.join(File.dirname(__FILE__), 'fixtures', file)
end