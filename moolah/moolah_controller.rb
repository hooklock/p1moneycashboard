require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/account')
require_relative('./controllers/account_controller')
require_relative('./models/merchant')
require_relative('./controllers/merchant_controller')
require_relative('./models/category')
require_relative('./controllers/category_controller')
require_relative('./models/purchase')
require_relative('./controllers/transaction_controller')

get '/' do
  erb(:home)
end

get('/activity') do
  @accounts = Account.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  @purchases = Purchase.all()
  erb(:list)
end

