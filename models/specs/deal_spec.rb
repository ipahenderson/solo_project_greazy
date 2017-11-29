require 'minitest/autorun'
require 'minitest/rg'
require_relative('../deal.rb')
require_relative('../eatery.rb')
require_relative('../burger.rb')



class TestDeal < Minitest::Test

  def setup
    @burger1 = Burger.new({'name' => 'Mini Melt Burger', 'type' => :cheeseburger, 'price' => 3.00, 'logo' => 'http://i66.tinypic.com/104papy.jpg'})
    @burger2 = Burger.new({'name' => 'The Big Cheese', 'type' => :cheeseburger, 'price' => 7.50, 'logo' => 'http://i68.tinypic.com/2hga0x2.jpg'})

    @eatery1 = Eatery.new({'name' => 'Sliderz', 'contact' => '34 Baggins Street', 'logo' => 'http://2c2f06a14a9ade4267e6-fb8aac3b3bf42afe824f73b606f0aa4c.r92.cf1.rackcdn.com/tenantlogos/26890.png'})
    @eatery2 = Eatery.new({'name' => 'Big Boy Burgers', 'contact' => '120 Wolfdale Road', 'logo' => 'http://i63.tinypic.com/6ok7cm.jpg'})

    @deal1 = Deal.new({'name' => '4-4-1 Sliderz', 'discount' => 0.50, 'day' => 'Thursday', 'eatery_id' => 1, 'burger_id' => 1})
    @deal2 = Deal.new({'name' => 'Half-Price Half-Pounder', 'discount' => 0.50, 'day' => 'Tuesday', 'eatery_id' => 1, 'burger_id' => 1})
    @deal3 = Deal.new({'name' => 'Haooof-Price Half-Pounder', 'discount' => 0.50, 'day' => 'Monday', 'eatery_id' => 1, 'burger_id' => 1})

  end


  def test_apply_discount
    result = @deal1.apply_discount
    assert_equal(result, 1.50)
  end


end
