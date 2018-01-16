require 'nokogiri'

class DevicesXML

  def initialize
    @minischema = Nokogiri::XML(File.open('./mini-schema.xml'))
  end

  def get_all_device_names
    names_array = []
    @minischema.xpath('//name').each do |name|
      names_array.push(name.text)
    end
    names_array
  end

  def get_all_devices
    devices_array = []
    @minischema.xpath('//device').each do |device|
      devices_array.push(device)
    end
    devices_array
  end

end
