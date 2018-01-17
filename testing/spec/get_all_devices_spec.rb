require 'spec_helper'

describe DevicesXML do
  context 'For the get all devices' do

    before(:all) do
      @devices = DevicesXML.new.get_all_devices_as_a_hash
    end


    it "I expect the results to be a hash" do
      expect(@devices).to be_kind_of(Hash)
    end

    it "I expect each device name to be a key that contains a hash" do
      keys = @devices.keys
      keys.each do |key|
        expect(@devices[key]).to be_kind_of(Hash)
      end
    end

    it 'I expect each device name key to contain two keys'do
      keys = @devices.keys
      keys.each do |key|
        expect(@devices[key].length).to be 2
      end
    end


  end
end
