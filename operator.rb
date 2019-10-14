require "./menu"

class Operator

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
    (command == 1)? diner_eat_in : diner_takeout
  end

  def fastfood
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
    (command == 1)? fastfood_eat_in : fastfood_takeout
  end
end

@operator = Operator.new

#食堂(店内)　消費税10%　還元ポイント5%　会計処理
def diner_eat_in
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text
  #食堂メニュー一覧表示　　　　
  diner_menus_report

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @diner_menus[order]

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
  お会計は#{selected_menu.tax10(count)}円(消費税10%)です!!
  -------------------------------------
  お支払いは
  1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
  -------------------------------------
  text

  command = gets.chomp.to_i

  if    command >= 2
    puts <<~text
    #{selected_menu.tax10(count)}円をキャッシュレス決済します！
    還元ポイントは#{(selected_menu.tax10(count)*0.05).to_i}円分(5%分)です！
    ありがとうございました！
    text
  else
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.tax10(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.tax10(count)}円のお返しです！
        ありがとうございました！
        text
        break
      else bill < selected_menu.tax10(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end

#食堂(持ち帰り)　消費税8%　還元ポイント5%　会計処理
def diner_takeout
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text
  #食堂メニュー一覧表示　　　
  diner_menus_report

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @diner_menus[order]

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
  お会計は#{selected_menu.tax8(count)}円(消費税8%)です!!
  -------------------------------------
  お支払いは
  1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
  -------------------------------------
  text

  command = gets.chomp.to_i
  if    command >= 2
    puts <<~text
    #{selected_menu.tax8(count)}円をキャッシュレス決済します！
    還元ポイントは#{(selected_menu.tax8(count)*0.05).to_i}円分(5%分)です！
    ありがとうございました！
    text
  else
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.tax8(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.tax8(count)}円のお返しです！
        ありがとうございました！
        text
        break
      else bill < selected_menu.tax8(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end




#ファストフード(店内)　消費税10%　還元ポイント2%　会計処理
def fastfood_eat_in
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text
  ##ファストフードメニュー一覧表示　　　
  fastfood_menus_report

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @fast_menus[order]

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
  お会計は#{selected_menu.tax10(count)}円(消費税10%)です!!
  -------------------------------------
  お支払いは
  1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
  -------------------------------------
  text

  command = gets.chomp.to_i

  if    command >= 2
    puts <<~text
    #{selected_menu.tax10(count)}円をキャッシュレス決済します！
    ポイント還元は#{(selected_menu.tax10(count)*0.02).to_i}円分(2%分)です！
    ありがとうございました！
    text
  else
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.tax10(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.tax10(count)}円のお返しです！
        ありがとうございました！
        text
        break
      else bill < selected_menu.tax10(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end

#ファストフード(持ち帰り)　消費8%　還元ポイント2%　会計処理
def fastfood_takeout
  puts <<~text
  -------------------------------------
  ご注文をどうぞ！！
  -------------------------------------
  text
  #ファストフードメニュー一覧表示　
  fastfood_menus_report

  puts <<~text
  -------------------------------------
  メニューの番号を選択してください！
  -------------------------------------
  text

  order = gets.chomp.to_i - 1
  selected_menu = @fast_menus[order]
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
  お会計は#{selected_menu.tax8(count)}円(消費税8%)です!!
  -------------------------------------
  お支払いは
  1.現金？　2.クレジットカード？  3.デビットカード？  4.プリペイドカード？　5.バーコード決済
  -------------------------------------
  text

  command = gets.chomp.to_i
  if    command >= 2
    puts <<~text
    #{selected_menu.tax8(count)}円をキャッシュレス決済します！
    ポイント還元は#{(selected_menu.tax8(count)*0.02).to_i}円分(2%分)です！
    ありがとうございました！
    text
  else
    loop do
      puts "お支払い金額を入力してください"
      bill = gets.chomp.to_i
      if bill > selected_menu.tax8(count)
        puts <<~text
        #{bill}円のお預かりなので#{bill - selected_menu.tax8(count)}円のお返しです！
        ありがとうございました！
        text
        break
      else bill < selected_menu.tax8(count)
        puts "金額が不足してます"
        puts "もう一度"
        redo
      end
    end
  end
end
