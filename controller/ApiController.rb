class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    # display all devices
    get '/' do

      x = DevicesXML.new
      content_type :json
      posts = x.get_all_devices
      deviceArray = []

      posts.each do |post|
        deviceHash = {
          "name" => post.xpath('//name'),
          "value" => post.xpath('//value'),
          "notes" => post.xpath('//notes')
        }

        deviceArray.push(deviceHash)


      end

      deviceArray.to_json
    end

end
