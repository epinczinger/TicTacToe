#!/usr/bin/env ruby
puts 'Hello World'

class User
  attr_accessor :name
  def initialize (s)
    print " Write you name: "
    @name= gets.chomp
    @s=s
    puts "Welcome #{@name}. Your symbol is #{@s}"
  end
end

class Board
  counter=9

  def initialize
    #blank board
  end

  def display
    #how the board is displayed
  end

  def turn(location)
    # add a symbol to the boar
  end
end


puts "*********************************"
puts "***       TIC TAC TOE        ****"
puts "*********************************"
user1=User.new("X")
user2=User.new("O")
