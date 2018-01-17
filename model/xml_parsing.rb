require 'nokogiri'

class DevicesXML

  def initialize
    @minischema = Nokogiri::XML(File.open('mini-schema.xml'))
  end

  def get_all_devices
    devices_array = []
    @minischema.xpath('//device').each do |device|
      devices_array.push(device)
    end
    devices_array
  end


  def get_all_devices_as_a_hash

    posts = get_all_devices
    hashDevices = Hash.new
    posts.each do |post|
      hashDevices[post.xpath('child::name').text] = {
        "value" => post.xpath('child::value').text,
        "notes" => post.xpath('child::notes').text
      }
    end
    hashDevices
  end

  def get_notes_for_specific_device(devicename)
    hashDevices = get_all_devices_as_a_hash
    hashDevices[devicename]['notes']
  end

  def get_hash_for_specific_device(devicename)
    hashDevices = get_all_devices_as_a_hash
    hashDevices[devicename]
  end

  def get_array_of_keys
    array = get_all_devices_as_a_hash.keys
  end

end

# x = DevicesXML.new
#
# # puts x.get_all_devices_as_a_hash
# # puts x.get_hash_for_specific_device('smartplug_old_1')
# # puts x.get_array_of_keys
# puts x.get_notes_for_specific_device('hub_ethernet_cosy')
