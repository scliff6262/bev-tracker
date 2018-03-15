class BeverageController < AppController


  get '/beverages/new' do
  
    erb :'beverages/new'
  end

  get '/beverages/:id' do
    @bev = Beverage.find(params[:id])
    erb :"/beverages/show"
  end

end
