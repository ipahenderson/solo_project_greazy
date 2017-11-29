require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/eatery')
# require_relative('controllers/burgers_controller')
# require_relative('controllers/eateries_controller')


get '/eateries' do
  @eateries = Eatery.all
  erb(:'eateries/index')
end

get '/eateries/new' do
  @deals = Deal.all
  @eateries = Eatery.all
  @burgers = Burger.all
  erb(:'eateries/new')
end
post '/eateries' do
  eatery = Eatery.new(params)
  eatery.save
  redirect to("/eateries")
end


get '/eateries/:id/edit' do
  @eatery = Eatery.find(params[:id])
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  erb (:"/eateries/edit")
end

put '/eateries/:id' do
  Eatery.new(params).update
  redirect to '/eateries'
end

get '/eateries/:id' do
  @eatery = Eatery.find(params[:id])
  erb(:'eateries/show')
end

delete '/eateries/:id' do
  eatery = Eatery.find(params[:id])
  eatery.delete
  redirect to("/admin/eateries")
end
