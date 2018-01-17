require 'rspec'
require_relative '../../model/xml_parsing.rb'
require 'rack/test'
require_relative '../../controller/ApiController.rb'
require 'sinatra/base'


RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
