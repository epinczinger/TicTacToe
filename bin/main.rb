#!/usr/bin/env ruby

require 'colorize'

class User
  attr_reader :symb , :name
  def initialize(symb)
    print ' Write your name: '
    @name = gets.chomp
    @symb = symb
    puts "Welcome #{@name}. Your symbol to play is #{@symb}"
  end
end

class Board
  attr_reader :symb , :counter

  def initialize
    @b = Array.new(3) { |i| Array.new(3) { |j| ((i * 3 + j + 1)).to_s } }
    @counter = 9
    @symb = ''
  end

  def display
    3.times { |i| p @b[i] }
  end

  def turn(symb, loc)
    if !loc.to_s.match?(/[1-9]/) || loc.to_s.length != 1 || @b[(loc - 1) / 3][(loc - 1) % 3].match?(/[XO]/)
      puts 'Invalid choice, please try again'.red
    else
      @b[(loc - 1) / 3][(loc - 1) % 3] = symb
      if winner(@b)
        @counter = 0
        @symb = symb
      end
      @counter -= 1
    end
  end

  private

  def winner(_testboard)
    # to test winner change to true
    false
  end
end

puts '*********************************'.red
puts '****'.red + '      TIC TAC TOE        ' + '****'.red
puts '*********************************'.red
user = []
user << User.new('X')
user << User.new('O')

board = Board.new
board.display

while board.counter.positive?
  current = (board.counter + 1) % 2
  puts "It's your turn #{user[current].name.yellow}!\nPlease select the number of an empty box:"
  selected_number = gets.chomp.to_i

  board.turn(user[current].symb, selected_number)
  puts '***********************************'
  board.display
end

if board.symb == ''
  puts "It's a DRAW".green
else
  i = user.index { |x| x.symb == board.symb }
  puts "#{user[i].name} is the WINNER".green
end
