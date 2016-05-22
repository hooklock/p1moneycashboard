#NEW
get '/merchants/new' do
  erb(:'merchant/new')
end

#INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb(:'/merchant/index')
end

#CREATE
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to('/merchants')
end

#SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchant/show')
end

#EDIT
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchant/edit')
end

#UPDATE
put '/merchants/:id' do
  @merchant = Merchant.update(params)
  redirect to("/merchants/#{params[:id]}")
end

#DELETE
delete '/merchants/:id' do
  Merchant.destroy(params[:id])
  redirect to("/merchants")
end