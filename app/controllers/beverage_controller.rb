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
    if @bev.user.is_private
      erb :'users/private'
    else
      erb :"/beverages/show"
    end
  end

end
