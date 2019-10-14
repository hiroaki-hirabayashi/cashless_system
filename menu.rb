class Menu

  attr_accessor :name, :price, :type

  def initialize(name:, price:, type:)
    @name = name
    @price = price
    @type = type
  end

  def info
    return "#{@name} #{@price}円 #{@type}"
  end

  # 　　　#消費税8%
  def tax8(count)
    tax8 = (@price * count * 1.08).to_i
  end

  #消費税10%
  def tax10(count)
    tax10 = (@price * count * 1.1).to_i
  end
end


#ファストフードメニュー一覧表示　
def fastfood_menus_report
  f_food1 = Menu.new(name: "ビックハンバーガーセット", price: 680, type:"Food")
  f_food2 = Menu.new(name: "テリヤキバーガーセット", price: 580, type:"Food")
  f_food3 = Menu.new(name: "チキンタツタバーガーセット", price: 580, type:"Food")
  f_food4 = Menu.new(name: "チキンナゲット", price: 380, type:"Food")
  f_drink1 = Menu.new(name: "コーラ", price: 220, type:"Drink")
  f_drink2 = Menu.new(name: "シェイク", price: 290, type:"Drink")
  @fast_menus = [f_food1, f_food2, f_food3, f_food4, f_drink1, f_drink2]
    index = 0
  @fast_menus.each do |menu|
    puts "#{index += 1}. #{menu.info}"
  end
end

#食堂メニュー一覧表示　
def diner_menus_report
  d_food1 = Menu.new(name: "海鮮丼", price: 980, type:"Food")
  d_food2 = Menu.new(name: "釜揚げうどん", price: 264, type:"Food")
  d_food3 = Menu.new(name: "ラーメン", price: 655, type:"Food")
  d_food4 = Menu.new(name: "天ぷら定食", price: 880, type:"Food")
  d_drink1 = Menu.new(name: "コーヒー", price: 290, type:"Drink")
  d_drink2 = Menu.new(name: "生ビール", price: 500, type:"Alcohol Drink")
  @diner_menus = [d_food1, d_food2, d_food3, d_food4, d_drink1, d_drink2]
   index = 0
  @diner_menus.each do |menu|
    puts "#{index += 1}. #{menu.info}"
  end
end
