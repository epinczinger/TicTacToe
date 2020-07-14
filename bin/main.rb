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

  def turn(_symb, loc)
    @b[(loc - 1) / 3][(loc - 1) % 3] = symb
  end
end

puts '*********************************'
puts '****      TIC TAC TOE        ****'
puts '*********************************'
user = []
user << User.new('X')
user << User.new('O')

board = Board.new
board.display

while board.counter.positive?
  cu = board.counter % 2
  print "#{user[cu].name} select the number of an empty box:"
  n = gets.chomp.to_i
  board.turn(user[cu].symb, n)
  puts '***********************************'
  board.display
  board.counter -= 1
end
