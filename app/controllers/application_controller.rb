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
      !!session[:user_id]
    end

    def this_user
      User.find(session[:user_id]) if logged_in?
    end

    def logout
      sessions.clear
    end
  end

end
