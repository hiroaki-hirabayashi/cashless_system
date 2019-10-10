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

  def tax8(count)
    tax8 = (@price * count * 1.08).to_i
  end

  def tax10(count)
    tax10 = (@price * count * 1.1).to_i
  end
end




food1 = Menu.new(name: "ビックハンバーガーセット", price: 680, type:"Food")
food2 = Menu.new(name: "テリヤキバーガーセット", price: 580, type:"Food")
food3 = Menu.new(name: "チキンタツタバーガーセット", price: 580, type:"Food")
food4 = Menu.new(name: "チキンナゲット", price: 380, type:"Food")
drink1 = Menu.new(name: "コーラ", price: 220, type:"Drink")
drink2 = Menu.new(name: "シェイク", price: 290, type:"Drink")
@fast_menus = [food1, food2, food3, food4, drink1, drink2]


food4 = Menu.new(name: "海鮮丼", price: 980, type:"Food")
food5 = Menu.new(name: "釜揚げうどん", price: 264, type:"Food")
food6 = Menu.new(name: "ラーメン", price: 655, type:"Food")
food7 = Menu.new(name: "天ぷら定食", price: 880, type:"Food")
drink3 = Menu.new(name: "コーヒー", price: 290, type:"Drink")
drink4 = Menu.new(name: "生ビール", price: 500, type:"Alcohol Drink")
@diner_menus = [food4, food5, food6, food7, drink3, drink4]
