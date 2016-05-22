#NEW
get 'accounts/new' do
  erb(:'account/new')
end

#INDEX
get '/accounts' do
  @accounts = Account.all()
  erb(:'/account/index')
end

#CREATE
post '/accounts' do
  @account = Account.new(params)
  @account.save
  redirect to('/accounts')
end

#SHOW
get '/accounts/:id' do
  @account = Account.find(params[:id])
  erb(:'account/show')
end

#EDIT
get '/accounts/:id/edit' do
  @account = Account.find(params[:id])
  erb(:'account/edit')
end

#UPDATE
put '/accounts/:id' do
  @account = Account.update(params)
  redirect to("/accounts/#{params[:id]}")
end

#DELETE
delete 'accounts/:id' do
  Account.destroy(params[:id])
  redirect to("/accounts")
end