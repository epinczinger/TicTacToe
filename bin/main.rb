#!/usr/bin/env ruby

require 'colorize'

class User
  attr_accessor :name
  attr_reader :symb
  def initialize(symb)
    print ' Write your name: '
    @name = gets.chomp
    @symb = symb
    puts "Welcome #{@name}. Your symbol is #{@symb}"
  end
end

class Board
  attr_accessor :counter

  def initialize
    # @b=Array.new(3) {|i| i=Array.new(3){|j| j=" "}}
    @b = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @counter = 9
  end

  def display
    3.times { |i| p @b[i] }
  end

  def turn(symb, loc)
    if  @b[(loc - 1) / 3][(loc - 1) % 3] == "X" ||  @b[(loc - 1) / 3][(loc - 1) % 3] == "O"
        puts "Invalid"
    else
    @b[(loc - 1) / 3][(loc - 1) % 3] = symb  
    @counter -= 1
    end
  end
end

puts '*********************************'.red
puts '****'.red + '      TIC TAC TOE        '+'****'.red
puts '*********************************'.red
user = []
user << User.new('X')
user << User.new('O')

board = Board.new
board.display

while board.counter.positive?
  current = board.counter % 2
  print "#{user[current].name} select the number of an empty box:"
  selected_number = gets.chomp.to_i
 
  board.turn(user[current].symb, selected_number)
  puts '***********************************'
  board.display
end 

