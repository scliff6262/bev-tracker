class UserController < AppController

  get '/login' do
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/user/#{@user.id}"
    else
      redirect "/login"
    end
  end

  get '/signup' do
    erb :new
  end

end
