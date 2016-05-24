class Analysis

  attr_reader(:purchases)

  def initialize(purchases)
    @purchases = purchases
  end

  def total_purchases()
    total = @purchases.inject(0){ |sum, purchase| sum + purchase.pur_amount }
    return total.round(2)
  end

  def total_by_type(id)
    # purchases = Category.purchases(id)
    total = 0
    @purchases.each {|pur| total += pur.pur_amount}
    # total = @purchases.inject(0) do |sum, purchase|
    #  if purchase.cat_id == id
    #   binding.pry
    #   sum + purchase.pur_amount 
    #  end
    # end
    return total.round(2)
  end

end