require_relative "game"
# Class Board
class Board
  COLOR_HINT = {
    black: "⚫",
    white: "⚪"
  }.freeze

  attr_accessor :guesses_history, :hints

  def initialize
    @grid = Array.new(0)
    @guesses_history = Array.new(12) { [] }
    @hints = Array.new(12)
  end

  def display
    puts "-----------------------------------------------------"
    puts "-     🔐 GUESS THE CODE MOTHER FUCKER! 🔐          -"
    puts "-----------------------------------------------------"
    @guesses_history.each_with_index do |array, index|
      puts ""
      array.each do |color|
        print " "
        print "#{Game::COLOR[color]} "
        print " "
      end
      print " "
      hints_for_row = @hints[index] || []
      hints_for_row.each do |hint_color|
        hint_color.nil? ? hint_color = :X : hint_color.to_sym
        print "#{COLOR_HINT[hint_color.to_sym] || 'X'} "
      end
    end
    puts " "
    puts "-----------------------------------------------------"

    puts "Enter the corresponding number: "
    Game::COLOR.each_with_index do |(_key, value), index|
      print "#{value} =>"
      puts " #{index + 1}"
    end
  end

  def winner?(hints)
    count = 0
    hints.each do |hint|
      count += 1 if hint == "black"
    end
    true if count == 4
  end
end
