require_relative('../db/sql_runner')

class Category

  attr_reader(:id, :cat_name, :pur_id)

  def initialize(options)
    @id = options['id'].to_i
    @cat_name = options['cat_name']
    @pur_id = options['pur_name']
  end

  def save()
    sql = "INSERT INTO categories (cat_name, pur_id) VALUES ('#{@cat_name}', #{@pur_id}) RETURNING *"
    category = SqlRunner.run(sql)
    result = Category.new(category)
    return result
  end

  def purchases()
    sql = "SELECT * FROM purchases WHERE id = #{@pur_id}"
    return Purchase.map_items(sql)
  end

  def budget()
    sql = "SELECT * FROM budgets WHERE cat_id =  #{@id}"
    return Budget.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM categories"
    return Category.map_items(sql)
  end

  def self.find()
    sql = "SELECT * FROM categories WHERE id = #{id}"
    return Category.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE categories SET
    cat_name = '#{options['cat_name']}',
    pur_id = #{options['pur_id']}
    WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM categories WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    categories = SqlRunner.run(sql)
    result = categories.map { |category| Category.new(category) }
    return result
  end

  def self.map_item(sql)
    result = Category.map_items(sql)
    return result.first
  end


end