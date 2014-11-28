require 'rubygems'
require 'bundler/setup'
require '3pl_central'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end
