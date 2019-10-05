class Menu
  attr_accessor :name, :price

  def initialize(name:, price:)
    self.name = name
    self.price = price
  end

  def info
    return "#{self.name} #{self.price}円 "
  end

  def get_total_price_8(count)
    tax8 = (self.price * count * 1.08).to_i
  end

  def get_total_price_10(count)
    tax10 = (self.price * count * 1.1).to_i
  end

end


class Food < Menu
  attr_accessor :name, :price

  def initialize(name:, price:)
    super(name: name, price: price)
  end

end


class Drink < Menu
  attr_accessor :name, :price

  def initialize(name:, price:)
    super(name: name, price: price)
  end

end
