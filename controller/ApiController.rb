class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    # Gets all the devices

    get '/' do

      x = DevicesXML.new
      content_type :json
      hashDevices = x.get_all_devices_as_a_hash
      hashDevices.to_json
    end

    # get an individual device
    get '/device' do
      x = DevicesXML.new
      content_type :json
      hashDevices = x.get_all_devices_as_a_hash
      hashDevices['hub_ethernet_cosy']['notes'].to_json

    end


end
