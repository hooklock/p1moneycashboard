require('pry-byebug')
require_relative('../models/account')
require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/purchase')

Purchase.delete_all()
Category.delete_all()
Account.delete_all()
Merchant.delete_all()

account1 = Account.new({'acc_num' => '12345678', 'acc_name' => 'Bills', 'balance' => 500.00})
account2 = Account.new({'acc_num' => '87654321', 'acc_name' => 'Current', 'balance' => 300.00})
account3 = Account.new({'acc_num' => '01122557', 'acc_name' => 'Savings', 'balance' => 1500.00})
a1 = account1.save()
a2 = account2.save()
a3 = account3.save()

merchant1 = Merchant.new({'mer_name' => 'Amazon'})
merchant2 = Merchant.new({'mer_name' => 'Lidl'})
merchant3 = Merchant.new({'mer_name' => 'John Lewis'})
merchant4 = Merchant.new({'mer_name' => 'O2'})
merchant5 = Merchant.new({'mer_name' => 'ZooPlus'})
merchant6 = Merchant.new({'mer_name' => 'Apple'})
m1 = merchant1.save()
m2 = merchant2.save()
m3 = merchant3.save()
m4 = merchant4.save()
m5 = merchant5.save()
m6 = merchant6.save()

category1 = Category.new({'cat_name' => 'Pets', 'budget' => 600.00})
category2 = Category.new({'cat_name' => 'Groceries', 'budget' => 900.00})
category3 = Category.new({'cat_name' => 'Clothes', 'budget' => 500.00})
category4 = Category.new({'cat_name' => 'Gifts', 'budget' => 400.00})
category5 = Category.new({'cat_name' => 'Car', 'budget' => 800.00})
category6 = Category.new({'cat_name' => 'Phone', 'budget' => 500.00})
c1 = category1.save()
c2 = category2.save()
c3 = category3.save()
c4 = category4.save()
c5 = category5.save()
c6 = category6.save()

purchase1 = Purchase.new({'pur_date' => '12 May 2016', 'pur_amount' => 30.00, 'description' => 'Dog Food', 'mer_id' => m5.id, 'acc_id' => a1.id, 'cat_id' => c1.id})
purchase2 = Purchase.new({'pur_date' => '10 May 2016', 'pur_amount' => 25.00, 'description' => 'Weekly Shop', 'mer_id' => m2.id, 'acc_id' => a2.id, 'cat_id' => c2.id})
purchase3 = Purchase.new({'pur_date' => '15 May 2016', 'pur_amount' => 40.00, 'description' => 'Mobile Phone Bill', 'mer_id' => m4.id, 'acc_id' => a1.id, 'cat_id' => c6.id})
purchase4 = Purchase.new({'pur_date' => '20 May 2016', 'pur_amount' => 50.00, 'description' => 'Head Phones', 'mer_id' => m1.id, 'acc_id' => a3.id, 'cat_id' => c4.id})
purchase5 = Purchase.new({'pur_date' => '03 May 2016', 'pur_amount' => 20.00, 'description' => 'Diesel', 'mer_id' => m2.id, 'acc_id' => a2.id, 'cat_id' => c2.id})
purchase6 = Purchase.new({'pur_date' => '06 May 2016', 'pur_amount' => 50.00, 'description' => 'Blouse', 'mer_id' => m3.id, 'acc_id' => a3.id, 'cat_id' => c3.id})
p1 = purchase1.save()
p2 = purchase2.save()
p3 = purchase3.save()
p4 = purchase4.save()
p5 = purchase5.save()
p6 = purchase6.save()

