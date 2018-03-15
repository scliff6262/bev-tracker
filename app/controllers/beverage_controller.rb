class BeverageController < AppController

  get '/beverages/new' do
    redirect '/' unless logged_in?

    erb :'beverages/new'
  end

  post '/beverages/new' do
    if this_user.beverages.build(params).save
      @bev = this_user.beverages.last
      redirect "/beverages/#{@bev.id}"
    else
      redirect "/beverages/new"
    end
  end

  get '/beverages/:id' do
    redirect '/' unless logged_in?

    @bev = Beverage.find(params[:id])
    if @bev.user.is_private && this_user != @bev.user
      erb :'users/private'
    else
      erb :"/beverages/show"
    end
  end

  get '/beverages/:id/edit' do
    redirect '/' unless logged_in?

    @bev = Beverage.find(params[:id])
    if this_user.beverages.include?(@bev)
      erb :'beverages/edit'
    else
      redirect "/beverages/#{@bev.id}"
    end
  end

  put '/beverages/:id' do
    @bev = Beverage.find(params[:id])
    @bev.name = params[:name]
    @bev.category = params[:category]
    @bev.rating = params[:rating]
    @bev.comments = params[:comments]
    @bev.save
    redirect "/beverages/#{@bev.id}"
  end

  get '/beverages/:id/delete' do
    redirect '/' unless logged_in?

    @bev = Beverage.find(params[:id])

    if this_user.beverages.include?(@bev)
      @bev.destroy
      redirect "/users/#{this_user.id}"
    else
      redirect "/beverages/#{@bev.id}"
    end

  end

end
