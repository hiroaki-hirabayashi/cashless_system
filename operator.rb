
require "./diner"
require "./fastfood"

puts <<~text
-------------------------------------
どちらで食事にしますか？
食堂に行きますか？　ファストフード店にしますか？

1.食堂             :還元ポイント5%実施店
2.ファストフード店 :還元ポイント2%実施店
-------------------------------------
コマンドを入力：
text

command = gets.chomp.to_i
if  command == 1
  diner
elsif command == 2
  fastfood
end
