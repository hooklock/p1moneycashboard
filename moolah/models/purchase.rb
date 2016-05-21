require_relative('../db/sql_runner')

class Purchase

  attr_reader(:id, :pur_date, :pur_amount, :description, :mer_id, :acc_id)

  def initialize(options)
    @id = options['id'].to_i
    @pur_date = options['pur_date']
    @pur_amount = options['pur_amount'].to_i
    @description = options['description']
    @mer_id = options['mer_id'].to_i
    @acc_id = options['acc_id'].to_i
  end

  def save()
    sql = "INSERT INTO purchases (pur_date, pur_amount, description, mer_id, acc_id) VALUES ('#{@pur_date}', #{@pur_amount}, '#{@description}', #{@mer_id}, #{@acc_id}) REURNING *"
    purchase = SqlRunner.run(sql)
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
    sql = "SELECT * FROM categories WHERE pur_id = #{id}"
    return Category.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM purchases"
    return Purchase.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT 8 FROM purchases WHERE id = #{id}"
    return Purchase.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE purchases SET
    pur_date = '#{options['pur_date']}',
    pur_amount = #{options['pur_amount']},
    description = '#{options['description']}',
    mer_id = #{options['mer_id']},
    acc_id = #{options['acc_id']}
    WHERE id = #{options{'id'}}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM purchases WHERE id  = #{id}"
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


