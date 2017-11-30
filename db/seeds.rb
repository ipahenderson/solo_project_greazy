require_relative('../models/burger')
require_relative('../models/eatery')
require_relative('../models/deal')

require('pry-byebug')

Deal.delete_all()
Eatery.delete_all()
Burger.delete_all()

burger1 = Burger.new({'name' => 'Mini Melt', 'type' => :cheeseburger, 'price' => 300, 'logo' => 'http://i66.tinypic.com/104papy.jpg'})
burger2 = Burger.new({'name' => 'The Big Cheese', 'type' => :cheeseburger, 'price' => 750, 'logo' => 'http://i68.tinypic.com/2hga0x2.jpg'})
burger3 = Burger.new({'name' => 'The Tall Burger', 'type' => :hamburger, 'price' => 675, 'logo' => 'https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/7/2016/07/190716_BiggestBurgers-JimisBurgers-TejalPandey.jpg'})
burger4 = Burger.new({'name' => 'Meat Is Murder', 'type' => :vegieburger, 'price' => 1290, 'logo' => 'https://www.thescottishsun.co.uk/wp-content/uploads/sites/2/2017/04/unless-e28093-hardcore-vegan-catering2.jpg?strip=all&w=800&quality=100'})
burger5 = Burger.new({'name' => 'The Big Cluck', 'type' => :chickenburger, 'price' => 750, 'logo' => 'http://bk-apac-prd.s3.amazonaws.com/sites/burgerking.co.nz/files/BUR2060C.Webtiles.500x400.CrispyChickenBurger.png'})
burger6 = Burger.new({'name' => 'Pork n Slaw', 'type' => :porkburger, 'price' => 820, 'logo' => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/7/2/0/DG0104H_pulled-pork-sandiwch_s4x3.jpg.rend.hgtvcom.616.462.suffix/1435869335054.jpeg'})
burger7 = Burger.new({'name' => 'Mini Meat', 'type' => :hamburger, 'price' => 300, 'logo' => 'https://cf.thetaylor-house.com/wp-content/uploads/2017/06/Burger5.jpg'})
burger8 = Burger.new({'name' => 'Veggie Supreme', 'type' => :vegieburger, 'price' => 1590, 'logo' => 'http://www.theporchcafe.com/wp-content/uploads/original-1.png'})


burger1.save
burger2.save
burger3.save
burger4.save
burger5.save
burger6.save
burger7.save
burger8.save

eatery1 = Eatery.new({'name' => 'Sliderz', 'contact' => '34 Baggins Street', 'logo' => 'http://2c2f06a14a9ade4267e6-fb8aac3b3bf42afe824f73b606f0aa4c.r92.cf1.rackcdn.com/tenantlogos/26890.png'})
eatery2 = Eatery.new({'name' => 'Big Boy Burgers', 'contact' => '120 Wolfdale Road', 'logo' => 'http://i63.tinypic.com/6ok7cm.jpg'})
eatery3 = Eatery.new({'name' => 'Philling Station', 'contact' => '65 Ledge St.', 'logo' => 'https://images-na.ssl-images-amazon.com/images/I/51YGq8kKLwL._SY450_.jpg'})
eatery4 = Eatery.new({'name' => 'Petit Jardine', 'contact' => '165 Posh Blvd.', 'logo' => 'https://i.pinimg.com/736x/bf/fa/62/bffa62b2416a7154de806c4e67896ba1--cute-cookies-iced-cookies.jpg'})
eatery5 = Eatery.new({'name' => 'The Whole Hog', 'contact' => '12 Farm Ave.', 'logo' => 'http://2.bp.blogspot.com/_51b2Mx7RKxY/TSpQgqqfWXI/AAAAAAAAAGc/CPHLfoPulkQ/s1600/Whole+Hog+Cafe+Logo+JPEG.jpg'})

eatery1.save
eatery2.save
eatery3.save
eatery4.save
eatery5.save

deal1 = Deal.new({'name' => '60% Sliderz', 'discount' => 0.60, 'day' => 'Thursday', 'eatery_id' => eatery1.id, 'burger_id' => burger1.id})
deal2 = Deal.new({'name' => '60% Sliderz', 'discount' => 0.60, 'day' => 'Thursday', 'eatery_id' => eatery1.id, 'burger_id' => burger7.id})
deal3 = Deal.new({'name' => 'Half-Price Big Boys', 'discount' => 0.50, 'day' => 'Tuesday', 'eatery_id' => eatery2.id, 'burger_id' => burger2.id})
deal4 = Deal.new({'name' => 'Half-Price Big Boys', 'discount' => 0.50, 'day' => 'Tuesday', 'eatery_id' => eatery2.id, 'burger_id' => burger5.id})
deal5 = Deal.new({'name' => 'Save the Animals Saturday', 'discount' => 0.80, 'day' => 'Saturday', 'eatery_id' => eatery4.id, 'burger_id' => burger4.id})
deal6 = Deal.new({'name' => 'Save the Animals Saturday', 'discount' => 0.80, 'day' => 'Saturday', 'eatery_id' => eatery4.id, 'burger_id' => burger8.id})
deal7 = Deal.new({'name' => 'Wild Wednesdays', 'discount' => 0.60, 'day' => 'Wednesday', 'eatery_id' => eatery5.id, 'burger_id' => burger6.id})
deal8 = Deal.new({'name' => 'Phil Yourself Up', 'discount' => 0.40, 'day' => 'Thursday', 'eatery_id' => eatery3.id, 'burger_id' => burger3.id})


deal1.save
deal2.save
deal3.save
deal4.save
deal5.save
deal6.save
deal7.save
deal8.save




binding.pry
nil
