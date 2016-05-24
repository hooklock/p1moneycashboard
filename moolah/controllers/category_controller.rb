#NEW
get '/categories/new' do
  erb(:'category/new')
end

#INDEX
get '/categories' do
  @categories = Category.all()
  erb(:'/category/index')
end

#CREATE
post '/categories' do
  @category = Category.new(params)
  @category.save
  redirect to('/categories')
end

#SHOW
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb(:'category/show')
end

#EDIT
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb(:'category/edit')
end

#UPDATE
put '/categories/:id' do
  @category = Category.update(params)
  redirect to("/categories/#{params[:id]}")
end

#DELETE
delete '/categories/:id' do
  Category.destroy(params[:id])
  redirect to("/categories")
end

get '/categories/:id/transactions' do
  @category = Category.find(params[:id])
  @purchases = Category.purchases(params[:id])
  @analysis = Analysis.new(@purchases)
  erb(:'category/transaction')
end