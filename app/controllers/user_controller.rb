class UserController < AppController

  get '/login' do
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
      redirect "/login"
    end
  end

  get '/signup' do
    binding.pry
    unless logged_in?
      erb :"users/new"
    else
      redirect "/user/#{this_user.id}"
    end
  end

  post '/signup' do
    @user = User.new(params)
    binding.pry

    if @user.save
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
      redirect "/signup"
    end
  end

  post '/user/:id/logout' do
    logout
    redirect '/'
  end

end
