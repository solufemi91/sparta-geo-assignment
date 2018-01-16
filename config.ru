require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controller/ApiController.rb'
use Rack::MethodOverride

run ApiController
