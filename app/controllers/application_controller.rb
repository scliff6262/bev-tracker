require './config/environment'
require 'sinatra/base'
require 'rack-flash'


class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def this_user
      User.find(session[:user_id])
    end

    def logout
      session.clear
    end

    def show_greeting
      session[:user_id] == params[:id].to_i ? "Hello #{this_user.first_name}"  : "#{User.find(params[:id]).first_name}'s Page"
    end

    def displayed_user_bevs(user_id)
      User.find(user_id).beverages
    end

    def ten_most_recently_reviewed
      sorted_bevs = Beverage.all.find_all {|obj| !obj.user.is_private}
      sorted_bevs.last(10).reverse
    end
  end

end
