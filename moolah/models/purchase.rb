require_relative('../db/sql_runner')
require('date')

class Purchase

  attr_reader(:id, :pur_date, :pur_amount, :description, :mer_id, :acc_id, :cat_id)

  def initialize(options)
    @id = options['id'].to_i
    @pur_date = Date.parse(options['pur_date'])
    @pur_amount = options['pur_amount'].to_f
    @description = options['description']
    @mer_id = options['mer_id'].to_i
    @acc_id = options['acc_id'].to_i
    @cat_id = options['cat_id'].to_i
  end

  def save()
    sql = "INSERT INTO purchases (pur_date, pur_amount, description, mer_id, acc_id, cat_id) VALUES ('#{@pur_date}', #{@pur_amount}, '#{@description}', #{@mer_id}, #{@acc_id}, #{@cat_id}) RETURNING *"
    purchase = SqlRunner.run(sql).first
    result = Purchase.new(purchase)
    return result
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@mer_id}"
    return Merchant.map_item(sql)
  end

  def account()
    sql = "SELECT * FROM accounts WHERE id = #{@acc_id}"
    return Account.map_item(sql)
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = #{@cat_id}"
    return Category.map_item(sql)
  end

  def nice_date(date)
    date.strftime("%e %B %Y")
  end

  def self.all()
    sql = "SELECT * FROM purchases ORDER BY pur_date DESC"
    return Purchase.map_items(sql)
  end

  # def self.total()
  #   @purchases = Purchase.all
  #   total = @purchases.inject(0){ |sum, purchase| sum + purchase.pur_amount}
  #   return total.round(2)
  # end

  def self.find(id)
    sql = "SELECT * FROM purchases WHERE id = #{id}"
    return Purchase.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE purchases SET
    pur_date = '#{options['pur_date']}',
    pur_amount = #{options['pur_amount']},
    description = '#{options['description']}',
    mer_id = #{options['mer_id']},
    acc_id = #{options['acc_id']},
    cat_id = #{options['cat_id']}
    WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM purchases WHERE id  = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM purchases"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    purchases = SqlRunner.run(sql)
    result = purchases.map { |purchase| Purchase.new(purchase) }
    return result
  end

  def self.map_item(sql)
    result =  Purchase.map_items(sql)
    return result.first
  end

end