require 'spec_helper'

describe DevicesXML do
  context 'For the get all devices' do

    before(:all) do
      @devices = DevicesXML.new.get_all_devices_as_a_hash
    end


    it "I expect the results to be a hash" do
      expect(@devices).to be_kind_of(Hash)
    end


  end
end
