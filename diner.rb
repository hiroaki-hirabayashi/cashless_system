require "./menu"

#下記のeat_inメソッドとtakeoutメソッドの処理をまとめるメソッド
def diner
  puts <<~text
  -------------------------------------
  いらっしゃいませ！
  店内をご利用されますか？それともお持ち帰りでしょうか？

  1.店内      :消費税10%
  2.持ち帰り  :消費税8%
  -------------------------------------
  コマンドを入力：
  text

  command = gets.chomp.to_i
  if  command == 1
    d_eat_in
  elsif command == 2
    d_takeout
  end
end



def d_eat_in
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text

  index = 0
  @d_menus.each do |menu|
    puts "#{index += 1}. #{menu.info}"
  end

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @d_menus[order]

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

  if    command >= 2
    puts <<~text
    ポイントは#{(selected_menu.get_total_price_10(count)*0.05).to_i}円分(5%分)を還元します！
    ありがとうございました！
    text
  elsif  command == 1
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.get_total_price_10(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.get_total_price_10(count)}円のお返しです！
        ありがとうございました！
        text
        break
      elsif bill < selected_menu.get_total_price_10(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end


def d_takeout
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text

  index = 0
  @d_menus.each do |menu|
    puts "#{index += 1}. #{menu.info}"
  end

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @d_menus[order]

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
  1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
  -------------------------------------
  text

  command = gets.chomp.to_i
  if    command >= 2
    puts <<~text
    ポイントは#{(selected_menu.get_total_price_8(count)*0.05).to_i}円分(5%分)を還元します！
    ありがとうございました！
    text
  elsif  command == 1
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.get_total_price_8(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.get_total_price_8(count)}円のお返しです！
        ありがとうございました！
        text
        break
      elsif bill < selected_menu.get_total_price_8(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end
