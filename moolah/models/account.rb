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
    return Purchase.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM accounts"
    return Account.map_items(sql)
  end

  def self.find()
    sql = "SELECT * FROM accounts WHERE id = #{id}"
    return Account.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE accounts SET
    acc_num =  #{options['acc_num']},
    acc_name = '#{options['acc_name']}',
    balance = #{options['balance']}
    WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destory(id)
    sql = "DELETE FROM accounts WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    accounts = SqlRunner.run(sql)
    result = accounts.map { |account| Account.new(account) }
    return result
  end

  def self.map_item(sql)
    result = Account.map_items(sql)
    return result.first
  end

end