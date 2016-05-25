require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/analysis')
require_relative('./models/account')
require_relative('./controllers/account_controller')
require_relative('./models/merchant')
require_relative('./controllers/merchant_controller')
require_relative('./models/category')
require_relative('./controllers/category_controller')
require_relative('./models/purchase')
require_relative('./controllers/purchase_controller')

get '/' do
  erb(:home)
end

get('/activity') do
  # @category = Category.find(params[:id])
  # @purchases = Category.purchases(params[:id])
  @purchases = Purchase.all()
  @categories = Category.all()
  @analysis = Analysis.new(@purchases)
  erb(:list)
end

