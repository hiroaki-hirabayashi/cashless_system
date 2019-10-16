require "./menu"
class Operator

def eat_in
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


def takeout
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

end
