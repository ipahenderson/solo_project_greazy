require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/eatery')
# require_relative('controllers/burgers_controller')
# require_relative('controllers/eateries_controller')


get '/burgers' do
  @burgers = Burger.all
  erb(:'burgers/index')
end

get '/burgers/new' do
  @deals = Deal.all
  @eateries = Eatery.all
  @burgers = Burger.all
  erb(:'burgers/new')
end
post '/burgers' do
  params['price'] = (params['price'].to_f * 100)
  burger = Burger.new(params)
  burger.save
  redirect to("/burgers")
end


get '/burgers/:id/edit' do
  @burger = Burger.find(params[:id])
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  @types = [:cheeseburger, :hamburger, :veggieburger, :chickenburger, :porkburger]
  erb (:"/burgers/edit")
end

put '/burgers/:id' do
  params['type'] = params['type'].to_sym
  params['price'] = (params['price'].to_f * 100)
  Burger.new(params).update
  redirect to '/burgers'
end

get '/burgers/:id' do
  @burger = Burger.find(params[:id])
  erb(:'burgers/show')
end

delete '/burgers/:id' do
  burger = Burger.find(params[:id])
  burger.delete
  redirect to("/admin/burgers")
end
