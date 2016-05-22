require_relative('../db/sql_runner')

class Merchant

  attr_reader(:id, :mer_name)

  def initialize(options)
    @id = options['id'].to_i
    @mer_name = options['mer_name']
  end

  def save()
    sql = "INSERT INTO merchants (mer_name) VALUES ('#{@mer_name}') RETURNING *"
    merchant = SqlRunner.run(sql).first
    result = Merchant.new(merchant)
    return result
  end

  def purchases()
    sql = "SELECT * FROM purchases WHERE mer_id = #{@id}"
    return Purchase.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE merchants SET mer_name = '#{options['cat_name']}' WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM merchants WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end


end