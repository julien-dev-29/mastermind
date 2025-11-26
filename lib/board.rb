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
    @hints = Array.new(12) { [] }
  end

  def display
    puts "-----------------------------------------------------"
    puts "-            GUESS THE CODE MOTHER FUCKER!          -"
    puts "-----------------------------------------------------"
    @guesses_history.each_with_index do |arr, index|
      print " "
      arr.each do |color|
        print " "
        print "#{Game::COLOR[color]} "
      end
      print "                   "
      # safe iterate hints
      hints_for_row = @hints[index] || []
      hints_for_row.each do |hint|
        key = hint.is_a?(Symbol) ? hint : hint.to_s.strip.to_sym
        symbol = COLOR_HINT[key] || "  " # placeholder si absent
        print " #{symbol} "
      end

      puts " "
    end
    puts "-----------------------------------------------------"

    puts "Enter the corresponding number: "
    Game::COLOR.each_with_index do |(_key, value), index|
      print "#{value} =>"
      puts " #{index + 1}"
    end
  end
end
