LIB_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(LIB_PATH)
Dir[LIB_PATH + '/*.rb'].each { |f| require f }

require 'rspec'

RSpec.configure do |c|
  c.filter_run :focus => true
  c.run_all_when_everything_filtered = true
end
