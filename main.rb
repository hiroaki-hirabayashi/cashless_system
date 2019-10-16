require "./operator"
@flag = Operator.new

puts <<~text
-------------------------------------
どちらで食事にしますか？
店内にしますか？　持ち帰りにしますか？

1.店内
2.持ち帰り
-------------------------------------
コマンドを入力：
text

command = gets.chomp.to_i
 (command == 1)? @flag.eat_in : @flag.takeout
