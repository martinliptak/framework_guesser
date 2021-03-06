require 'fakeweb'
require 'nokogiri'
require 'yaml'
require 'framework_guesser'

require File.dirname(__FILE__) + '/support/helpers'

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
  
  config.include(Helpers)

  FakeWeb.allow_net_connect = false
end
