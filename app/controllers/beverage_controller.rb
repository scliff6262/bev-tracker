class BeverageController < AppController

  get '/beverages/new' do

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
    @bev = Beverage.find(params[:id])
    if @bev.user.is_private && this_user != @bev.user
      erb :'users/private'
    else
      erb :"/beverages/show"
    end
  end

  get '/beverages/:id/edit' do
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

end
