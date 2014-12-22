LIB_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

$LOAD_PATH.unshift(LIB_PATH)

require 'rspec'

Dir[LIB_PATH + '/*.rb'].each { |f| require f }
