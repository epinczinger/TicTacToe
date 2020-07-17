#!/usr/bin/env ruby

require 'colorize'

class User
  attr_reader :symb, :name
  def initialize(symb, name)
    @name = name
    @symb = symb
  end
end

class Board
  attr_reader :symb, :counter, :status, :b

  def initialize
    @b = Array.new(3) { |i| Array.new(3) { |j| ((i * 3 + j + 1)).to_s } }
    @counter = 9
    @symb = ''
  end

  def turn(symb, loc)
    if !loc.to_s.match?(/[1-9]/) || loc.to_s.length != 1 || @b[(loc - 1) / 3][(loc - 1) % 3].match?(/[XO]/)
      @status = false
    else
      @status = true
      @b[(loc - 1) / 3][(loc - 1) % 3] = symb
      if winner(@b)
        @counter = 0
        @symb = symb
      end
      @counter -= 1
    end
  end

  private

  def winner(test)
    trans = test.transpose
    (0...test.size).collect { |i| test[i][i] }.uniq.count == 1 ||
      (0...test.size).collect { |i| test[test.size - i - 1][i] }.uniq.count == 1 ||
      test.map { |x| x.uniq.count }.include?(1) ||
      trans.map { |x| x.uniq.count }.include?(1)
  end
end

puts '*********************************'.red
puts '****'.red + '      TIC TAC TOE        ' + '****'.red
puts '*********************************'.red
user = []
user_symbols = %w[X O]
2.times do |i|
  print "User #{i + 1}: Please write your name: "
  name = gets.chomp
  user << User.new(user_symbols[i], name)
  puts "Welcome #{user[i].name.yellow}. your symbol is #{user[i].symb.yellow}."
end

board = Board.new
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
