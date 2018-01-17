class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    get '/' do

      x = DevicesXML.new
      content_type :json
      posts = x.get_all_devices
      hashDevices = Hash.new
      posts.each do |post|
        hashDevices[post.xpath('child::name').text] = {
          "value" => post.xpath('child::value').text,
          "notes" => post.xpath('child::notes').text
        }
      end

      hashDevices.to_json
    end

end
