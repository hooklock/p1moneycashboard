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
  tmp_acc = Account.find(@purchase.acc_id)
  if Category.find(@purchase.cat_id).cat_name == "Income"
    tmp_acc.credit_balance(@purchase.pur_amount)
  else
    tmp_acc.debit_balance(@purchase.pur_amount)
  end
  tmp_acc.balance_update()
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
  pur = Purchase.find(params[:id])
  tmp_acc = Account.find(pur.acc_id)
  tmp_acc.credit_balance(pur.pur_amount)
  tmp_acc.balance_update()
  Purchase.destroy(pur.id)
  redirect to("/purchases")
end