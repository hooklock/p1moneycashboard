require_relative('../db/sql_runner')

class Account

  attr_reader(:id, :acc_num, :acc_name, :balance)

  def initialize(options)
    @id = options['id'].to_i
    @acc_num = options['acc_num'].to_i
    @acc_name = options['acc_name']
    @balance = options['balance'].to_i
  end

  def save()
    sql = "INSERT INTO accounts (acc_num, acc_name, balance) VALUES ('#{@acc_num}', '#{@acc_name}', '#{@balance}') RETURNING *"
    account = SqlRunner.run(sql).first
    result = Account.new(account)
    return result
  end

  def purchases()
    sql = "SELECT * FROM purchases WHERE acc_id = #{@id}"
    purchases = SqlRunner.run(sql)
    result = purchases.map{ |p| Purchase.new(p) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM accounts"
    accounts = SqlRunner.run(sql)
    result = accounts.map { |a| Account.new(a) }
    return result
  end

  def self.find()
    sql = "SELECT * FROM accounts WHERE id = #{id}"
    result = SqlRunner.run(sql)
    account = Account.new(result.first)
    return account
  end

  def self.update()
    sql = "UPDATE accounts SET
    acc_num =  #{options['acc_num']},
    acc_name = '#{options['acc_name']}',
    balance = #{options['balance']}
    WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destory()
    sql = "DELETE FROM accounts WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    account = SqlRunner.run(sql)
    result = account.map{ |account| Account.new(account) }
    return result
  end

  def self.map_item(sql)
    result = Account.map_items(sql)
    return result.first
  end

end