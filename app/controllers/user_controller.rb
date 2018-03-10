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
    #binding.pry

    if @user && @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/signup"
    end
  end

  get '/users/:id' do
    erb :"/users/show"
  end

  post '/users/:id/logout' do
    logout
    redirect '/'
  end

end
