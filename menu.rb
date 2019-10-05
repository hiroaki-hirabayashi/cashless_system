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

  def get_total_price_8(count)
    tax8 = (@price * count * 1.08).to_i
  end

  def get_total_price_10(count)
    tax10 = (@price * count * 1.1).to_i
  end


end


# class Food < Menu
#   attr_accessor :name, :price
#
#   def initialize(name:, price:)
#     super(name: name, price: price)
#   end
#
# end
#
#
# class Drink < Menu
#   attr_accessor :name, :price
#
#   def initialize(name:, price:)
#     super(name: name, price: price)
#   end
#
# end
#
# require "date"
# day = Date.today
# time = DateTime.now
# puts "---------------------------------------"
# puts(day)
# print(time.hour,"時",time.min,"分",time.sec,"秒\n")
