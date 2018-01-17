require 'spec_helper'

describe DevicesXML do
  context 'For the get all devices' do

    before(:all) do
      @devices = DevicesXML.new.get_all_devices_as_a_hash
      @deviceXML = DevicesXML.new
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

    it "I expect each device name key to be a string" do
      keys = @devices.keys
      keys.each do |key|
        expect(key).to be_kind_of(String)
      end
    end

    it 'I expect each device name key to contain two keys'do
      keys = @devices.keys
      keys.each do |key|
        expect(@devices[key].length).to be 2
      end
    end

    it 'I expect each value key to contain a string'do
      keys = @devices.keys
      keys.each do |key|
        expect(@devices[key]['value']).to be_kind_of(String)
      end
    end

    it 'I expect each notes key to contain a string'do
      keys = @devices.keys
      keys.each do |key|
        expect(@devices[key]['notes']).to be_kind_of(String)
      end
    end

    it 'I expect the hash to contain 31 devices'do
      expect(@deviceXML.get_array_of_keys.length).to be 31
    end

    it "I expect the hub_ethernet_cosy notes value to be Cosy hub, Ethernet microcontroller" do
      expect(@devices['hub_ethernet_cosy']['notes']).to eq 'Cosy hub, Ethernet microcontroller'
    end

    it "I expect the invalid notes value to be Don't assign this to a device!" do
      expect(@devices['invalid']['notes']).to eq "Don't assign this to a device!"
    end

    


  end
end
