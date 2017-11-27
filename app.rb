require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require('date')
require_relative('./models/burger')
require_relative('./models/deal')
require_relative('./models/eatery')

get '/' do
  @deals = Deal.all
  @today = Date.today.strftime("%a")
  erb(:index)
end
