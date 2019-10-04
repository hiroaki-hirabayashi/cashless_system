require "./menu"

require "date"
day = Date.today
time = DateTime.now
puts "----------------"
puts(day)
print(time.hour,"時",time.min,"分",time.sec,"秒\n")


food1 = Food.new(name: "海鮮丼", price: 980, eat: "店内利用")
food2 = Food.new(name: "釜揚げうどん（並）", price:264 , eat: "店内利用")
food3 = Food.new(name: "ラーメン", price: 655, eat: "店内利用")
drink1 = Drink.new(name: "greentea", price: 100, eat: "店内利用")
drink2 = Drink.new(name: "コーヒー", price: 290, eat: "店内利用")
drink3 = Drink.new(name: "生ビール", price: 500, eat: "店内利用")

food4 = Food.new(name: "海鮮丼", price: 980, eat: "お持ち帰り")
food5 = Food.new(name: "釜揚げうどん（並）", price: 264, eat: "お持ち帰り")
food6 = Food.new(name: "ラーメン", price: 655, eat: "お持ち帰り")
drink4 = Drink.new(name: "greentea", price: 100, eat: "お持ち帰り")
drink5 = Drink.new(name: "コーヒー", price: 290, eat: "お持ち帰り")
drink6 = Drink.new(name: "生ビール", price: 500, eat: "お持ち帰り")

menus_10 = [food1, food2, food3, drink1, drink2, drink3]

menus_8 = [food4, food5, food6, drink4, drink5, drink6]


puts <<~text
-------------------------------------
いらっしゃいませ！！！
ご注文をどうぞ！！
-------------------------------------
text

index = 0
menus_10.each do |menu_10|
  puts "#{index += 1}. #{menu_10.info}"
end

puts "- - - - - - - - - - - - - - - - - - "

menus_8.each do |menu_8|
  puts "#{index += 1 }. #{menu_8.info}"
end

puts <<~text
-------------------------------------
メニューの番号を選択してください！
-------------------------------------
text
                          ##ここから　　税率、選択した商品、合計金額、決済方法
order = gets.chomp.to_i - 1

selected_menu = menus_8[order] , menus_10[order]


puts <<~text
-------------------------------------
選択商品：#{selected_menu}

いくつご用意しますか？
個数を入力してください!!
-------------------------------------
text

count = gets.chomp.to_i
