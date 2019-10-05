require "./menu"


def takeout

  food1 = Food.new(name: "海鮮丼", price: 980)
  food2 = Food.new(name: "釜揚げうどん（並）", price: 264)
  food3 = Food.new(name: "ラーメン", price: 655)
  drink1 = Drink.new(name: "greentea", price: 100)
  drink2 = Drink.new(name: "コーヒー", price: 290)
  drink3 = Drink.new(name: "生ビール", price: 500)

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
お会計は#{selected_menu.get_total_price_8(count)}円(消費税8%)です!!
-------------------------------------
お支払いは
#{index -5}.現金？　#{index -4}.クレジットカード？ #{index -3}.プリペイド？ #{index -2}.バーコード決済？
-------------------------------------
text

pey = gets.chomp.to_i

if  pey == 1
  puts "ありがとうございました！"
else
  puts "#{(selected_menu.get_total_price_10(count)*0.05).to_i}円　還元です！
  ありがとうございました！"
end

end
