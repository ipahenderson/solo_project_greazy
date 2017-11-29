require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require('date')
require_relative('./models/burger')
require_relative('./models/deal')
require_relative('./models/eatery')
require_relative('controllers/deals_controller')
require_relative('controllers/burgers_controller')
require_relative('controllers/eateries_controller')

get '/' do
  @deals = Deal.all
  @today = Date.today.strftime("%A")
  erb(:index)
end
get '/weekly' do
  @deals = Deal.order_by_day
  erb(:weekly)
end

get '/admin' do
  erb(:admin)
end

get '/admin/deals' do
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  erb(:'admin/deals')
end

get '/admin/burgers' do
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  erb(:'admin/burgers')
end

get '/admin/eateries' do
  @deals = Deal.all
  @burgers = Burger.all
  @eateries = Eatery.all
  erb(:'admin/eateries')
end
