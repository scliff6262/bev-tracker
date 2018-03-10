require './config/environment'


class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def this_user
      User.find(session[:id]) if logged_in?
    end
  end

end
