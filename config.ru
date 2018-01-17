require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require_relative './controller/ApiController.rb'
require_relative './model/xml_parsing.rb'
use Rack::MethodOverride

run ApiController
