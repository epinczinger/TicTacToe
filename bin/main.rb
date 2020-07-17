#!/usr/bin/env ruby

require 'colorize'
require_relative '../lib/user.rb'
require_relative '../lib/board.rb'

puts '*********************************'.red
puts '****'.red + '      TIC TAC TOE        ' + '****'.red
puts '*********************************'.red
user = []
board = Board.new
2.times do |i|
  print "User #{i + 1}: Please write your name: "
  name = gets.chomp
  user << User.new(board.symbols[i], name)
  puts "Welcome #{user[i].name.yellow}. your symbol is #{user[i].symb.yellow}."
end

3.times { |i| p board.b[i] }

while board.counter.positive?
  current = (board.counter + 1) % 2
  puts "It's your turn #{user[current].name.yellow}!"
  print "Please select the number of an empty box to put an #{user[current].symb.yellow}:"
  selected_number = gets.chomp.to_i

  board.turn(user[current].symb, selected_number)
  puts "\n***********************************"
  puts 'Invalid choice, Try again!'.red unless board.status
  puts '***********************************'
  3.times { |i| p board.b[i] }
end

if board.symb == ''
  puts "It's a DRAW".green
else
  i = user.index { |x| x.symb == board.symb }
  puts "#{user[i].name} is the WINNER".green
end
