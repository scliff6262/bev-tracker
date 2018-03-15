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

    def sort_bevs_by_rank
      sorted_bevs = Beverage.all.find_all {|obj| !obj.user.is_private}.sort {|a, b| b.rating <=> a.rating}
      sorted_bevs.first(10)
    end
  end

end
