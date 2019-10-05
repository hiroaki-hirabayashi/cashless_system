require "./menu"
require "./eat_in_order"
require "./takeout_order"


index = 0
puts <<~text
-------------------------------------
いらっしゃいませ！
店内をご利用されますか？それともお持ち帰りでしょうか？

#{index += 1}.店内
#{index += 1}.持ち帰り
-------------------------------------
コマンドを入力：

text

command = gets.chomp.to_i

if  command == 1
   eat_in
elsif command == 2
  takeout
end
