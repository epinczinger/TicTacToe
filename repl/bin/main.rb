#!/usr/bin/env ruby

require_relative '../lib/user.rb'
require_relative '../lib/board.rb'



puts '*********************************'
puts '****' + '      TIC TAC TOE        ' + '****'
puts '*********************************'
user = []
board = Board.new


2.times do |i|
  print "User #{i + 1}: Please write your name: "
  name = gets.chomp
  user << User.new(board.symbols[i], name)
  puts "Welcome #{user[i].name}. your symbol is #{user[i].symb}."
end

puts board.display

while board.counter.positive?
  puts "It's your turn #{user[board.current].name}!"
  print "Please select the number of an empty box to put an #{user[board.current].symb}:"
  selected_number = gets.chomp.to_i

  puts "\n***********************************"
  puts 'Invalid choice, Try again!' unless board.turn(user[board.current].symb, selected_number)
  puts '***********************************'
  puts board.display
end

if board.symb == ''
  puts "It's a DRAW"
else
  puts board.symb + '!!!!'
  i = user.index { |x| x.symb == board.symb }
  puts "#{user[i].name} is the WINNER"
end


