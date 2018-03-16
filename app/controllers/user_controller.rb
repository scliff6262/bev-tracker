require 'sinatra/base'
require 'rack-flash'

class UserController < AppController

  get '/login' do
    redirect "/users/#{this_user.id}" if logged_in?
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Username and/or Password was incorrect. Please try again."
      redirect "/login"
    end
  end

  get '/signup' do
    unless logged_in?
      erb :"users/new"
    else
      redirect "/users/#{this_user.id}"
    end
  end

  post '/signup' do
    @user = User.new(params)

    if @user && @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/signup"
    end
  end

  get '/users/:id' do

    if !logged_in?
      erb :index
    elsif this_user.id == params[:id].to_i
      erb :"/users/show"
    elsif User.find(params[:id]).is_private
      erb :"/users/private"
    else
      erb :"/users/show"
    end
  end

  post '/users/:id/logout' do
    logout if logged_in?
    redirect '/'
  end

end
