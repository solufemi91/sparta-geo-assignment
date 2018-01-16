class ApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
      puts 'This is a test '
    end

end
