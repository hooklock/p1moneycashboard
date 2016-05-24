require('minitest/autorun')
require_relative('../models/analysis')
require_relative('../models/purchase')

class TestAnalysis < MiniTest::Test

  def setup()
    # purchase1 = Purchase.new({'pur_date' => '12 May 2016', 'pur_amount' => 30.00, 'description' => 'Dog Food', 'mer_id' => 5, 'acc_id' => 1, 'cat_id' => 1})
    # purchase2 = Purchase.new({'pur_date' => '10 May 2016', 'pur_amount' => 25.00, 'description' => 'Weekly Shop', 'mer_id' => 2, 'acc_id' => 2, 'cat_id' => 2})
    # purchase3 = Purchase.new({'pur_date' => '15 May 2016', 'pur_amount' => 40.00, 'description' => 'Mobile Phone Bill', 'mer_id' => 4, 'acc_id' => 1, 'cat_id' => 6})
    # purchase4 = Purchase.new({'pur_date' => '20 May 2016', 'pur_amount' => 50.00, 'description' => 'Head Phones', 'mer_id' => 1, 'acc_id' => 3, 'cat_id' => 4})
    # purchase5 = Purchase.new({'pur_date' => '03 May 2016', 'pur_amount' => 20.00, 'description' => 'Diesel', 'mer_id' => 2, 'acc_id' => 2, 'cat_id' => 2})
    # purchase6 = Purchase.new({'pur_date' => '06 May 2016', 'pur_amount' => 50.00, 'description' => 'Blouse', 'mer_id' => 3, 'acc_id' => 3, 'cat_id' => 3})

    # @purchases = [purchase1, purchase2, purchase3, purchase4, purchase5, purchase6]
    @analysis = Analysis.new(@purchases)
  end

  def test_total_purchases
    result = @analysis.total_purchases
    assert_equal(235.14, result)
  end

  def test_total_by_type(id)
    result = @analysis.total_by_type
    assert_equal(45.55, result)
    
  end

end