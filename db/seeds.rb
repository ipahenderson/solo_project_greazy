require_relative('../models/burger')
require_relative('../models/eatery')
require_relative('../models/deal')

require('pry-byebug')

Deal.delete_all()
Eatery.delete_all()
Burger.delete_all()

burger1 = Burger.new({'name' => 'Mini Melt Burger', 'type' => :cheeseburger, 'price' => 2.50, 'logo' => 'http://i66.tinypic.com/104papy.jpg'})
burger2 = Burger.new({'name' => 'The Big Cheese', 'type' => :cheeseburger, 'price' => 7.50, 'logo' => 'http://i68.tinypic.com/2hga0x2.jpg'})
burger1.save
burger2.save

eatery1 = Eatery.new({'name' => 'Sliderz', 'contact' => '34 Baggins Street', 'logo' => 'http://2c2f06a14a9ade4267e6-fb8aac3b3bf42afe824f73b606f0aa4c.r92.cf1.rackcdn.com/tenantlogos/26890.png'})
eatery2 = Eatery.new({'name' => 'Big Boy Burgers', 'contact' => '120 Wolfdale Road', 'logo' => 'http://i63.tinypic.com/6ok7cm.jpg'})

eatery1.save
eatery2.save

deal1 = Deal.new({'name' => '4-4-1 Sliderz', 'discount' => 0.33, 'day' => 'Thursday', 'eatery_id' => eatery1.id, 'burger_id' => burger1.id})
deal2 = Deal.new({'name' => 'Half-Price Half-Pounder', 'discount' => 0.50, 'day' => 'Tuesday', 'eatery_id' => eatery2.id, 'burger_id' => burger2.id})
deal3 = Deal.new({'name' => 'Haooof-Price Half-Pounder', 'discount' => 0.50, 'day' => 'Monday', 'eatery_id' => eatery2.id, 'burger_id' => burger2.id})

deal1.save
deal2.save
deal3.save




binding.pry
nil
