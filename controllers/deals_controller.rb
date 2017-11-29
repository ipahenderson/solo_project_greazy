require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/eatery')
# require_relative('controllers/burgers_controller')
# require_relative('controllers/eateries_controller')


get '/deals' do
  @deals = Deal.all
  erb(:'deals/index')
end

get '/deals/new' do
  @deals = Deal.all
  @eateries = Eatery.all
  @burgers = Burger.all
  erb(:'deals/new')
end
post '/deals' do
  deal = Deal.new(params)
  deal.save
  redirect to("/deals")
end


get '/deals/:id/edit' do
  @deal = Deal.find(params[:id])
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  erb (:"/deals/edit")
end

put '/deals/:id' do
  Deal.new(params).update
  redirect to '/deals'
end

get '/deals/:id' do
  @deal = Deal.find(params[:id])
  erb(:'deals/show')
end

delete '/deals/:id' do
  deal = Deal.find(params[:id])
  deal.delete
  redirect to("/admin")
end
