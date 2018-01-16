class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
      'This is a test '
      x = DevicesXML.new
      x.get_all_device_names
    end

end
