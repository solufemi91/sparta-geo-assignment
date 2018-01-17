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
      expect(last_response.body).to include("shithead")
    end

  end
end
