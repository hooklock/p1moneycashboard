require_relative('../db/sql_runner')

class Budget

  attr_reader()

  def initialize(options)
    @id = options['id'].to_i
    @bud_amount = options['bud_amount'].to_i
    @cat_id = options['cat_id'].to_i
  end





end