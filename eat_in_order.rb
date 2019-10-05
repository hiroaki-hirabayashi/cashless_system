require "./menu"


def eat_in

food1 = Menu.new(name: "海鮮丼", price: 980, type:"Food")
food2 = Menu.new(name: "釜揚げうどん（並）", price:264, type:"Food" )
food3 = Menu.new(name: "ラーメン", price: 655, type:"Food")
drink1 = Menu.new(name: "greentea", price: 100, type:"Drink")
drink2 = Menu.new(name: "コーヒー", price: 290, type:"Drink")
drink3 = Menu.new(name: "生ビール", price: 500, type:"Alcohol Drink")

menus = [food1, food2, food3, drink1, drink2, drink3]

puts <<~text
-------------------------------------
ご注文をどうぞ！！
-------------------------------------
text



index = 0
menus.each do |menu|
  puts "#{index += 1}. #{menu.info}"
end


puts <<~text
-------------------------------------
メニューの番号を選択してください！
-------------------------------------
text

order = gets.chomp.to_i - 1

selected_menu = menus[order]


puts <<~text
-------------------------------------
選択商品：#{selected_menu.name}

いくつご用意しますか？
個数を入力してください!!
-------------------------------------
text

count = gets.chomp.to_i

puts <<~text
商品：#{selected_menu.name}
個数：#{count}個
お会計は#{selected_menu.get_total_price_10(count)}円(消費税10%)です!!
-------------------------------------
お支払いは
1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
-------------------------------------
text

command = gets.chomp.to_i

if  command == 1
  puts "ありがとうございました！"
else
  puts "#{(selected_menu.get_total_price_10(count)*0.05).to_i}円　還元です！
  ありがとうございました！"
end

end
