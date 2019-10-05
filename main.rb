require "./menu"
require "./eat_in_order"
require "./takeout_order"
require "date"
day = Date.today
time = DateTime.now
puts "---------------------------------------"
puts(day)
print(time.hour,"時",time.min,"分",time.sec,"秒\n")


index = 0
puts <<~text
-------------------------------------
いらっしゃいませ！！！　
ご利用方法は？
#{index += 1}.店内　#{index += 1}.持ち帰り
-------------------------------------
text

pey = gets.chomp.to_i

if  pey == 1
   eat_in
elsif pey == 2
  takeout
end
