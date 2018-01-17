class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    # Gets all the devices

    devicename = 0
    hashDevices = Hash.new

    get '/' do

      x = DevicesXML.new
      content_type :json
      hashDevices = x.get_all_devices_as_a_hash
      hashDevices.to_json

    end

    # get notes for an individual device
    get '/device' do
      x = DevicesXML.new
      content_type :json
      hashDevices = x.get_notes_for_specific_device(devicename)
      hashDevices.to_json

    end


    # returns the formpage to enter the phone id
    get '/formpage' do
      erb :'api/index'
    end

    # create a new device
    get '/formpage/new' do
      erb :'api/new'
    end

    #processed the information entered by the user
    post '/formpage' do
      devicename = params[:devicename]
      redirect '/device'
    end

    # attempt to create a new device 
    post '/formpage/new' do
      newDeviceName = params[:devicename]
      newDeviceValue = params[:devicevalue]
      newDeviceNotes = params[:devicenotes]
      hashDevices[newDeviceName] = {
        "value" => newDeviceValue,
        "notes" => newDeviceNotes
      }
      # puts hashDevices
      redirect '/'
    end


end
