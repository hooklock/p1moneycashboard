#NEW
get '/purchases/new' do
  @accounts = Account.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:'purchase/new')
end

#INDEX
get '/purchases' do
  @purchases = Purchase.all()
  @analysis = Analysis.new(@purchases)
  erb(:'/purchase/index')
end

#CREATE
post '/purchases' do
  @purchase = Purchase.new(params)
  @purchase.save
  redirect to('/purchases')
end

#SHOW
get '/purchases/:id' do
  @purchase = Purchase.find(params[:id])
  erb(:'purchase/show')
end

#EDIT
get '/purchases/:id/edit' do
  @purchase = Purchase.find(params[:id])
  @accounts = Account.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:'purchase/edit')
end

#UPDATE
put '/purchases/:id' do
  @purchase = Purchase.update(params)
  redirect to("/purchases/#{params[:id]}")
end

#DELETE
delete '/purchases/:id' do
  Purchase.destroy(params[:id])
  redirect to("/purchases")
end