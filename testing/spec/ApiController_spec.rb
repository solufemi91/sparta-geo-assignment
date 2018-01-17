require 'spec_helper'
require_relative '../../controller/ApiController.rb'

describe 'ApiController' do
  include Rack::Test::Methods

  def app
    ApiController.new
  end

  context 'ApiXML App' do

    it "/ displays all devices" do
      get '/'
      expect(last_response.body).to include("hub_ethernet_cosy")
    end


    it "/device/:id displays the correct" do
      get '/device/smartplug_old_2'
      expect(last_response.body).to include("Legacy Legato smartplug 2")
    end

  end
end
