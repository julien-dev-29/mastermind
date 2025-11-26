require_relative "board"

# Class Game
class Game
  COLOR = {
    red: "🔴",
    blue: "🔵",
    green: "🟢",
    yellow: "🟡",
    orange: "🟠",
    purple: "🟣",
    brown: "🟤"
  }.freeze
  def initialize
    @board = Board.new
    @turn = 0
    @code = COLOR.to_a.sample(4).to_h
  end

  def play
    loop do
      system("clear") || system("cls")
      @board.display
      puts @code
      print "Color 1:"
      color1 = COLOR.keys.to_a[gets.chomp.to_i - 1]
      print "Color 2:"
      color2 = COLOR.keys.to_a[gets.chomp.to_i - 1]
      print "Color 3:"
      color3 = COLOR.keys.to_a[gets.chomp.to_i - 1]
      print "Color 4:"
      color4 = COLOR.keys.to_a[gets.chomp.to_i - 1]
      @board.guesses_history[@turn].push(color1, color2, color3, color4)
      check_code
      @turn += 1
    end
  end

  def check_code
    @board.guesses_history[@turn].each_with_index do |color, index_guesses|
      @code.keys.each_with_index do |code_color, code_index|
        next unless color == code_color

        @board.hints[@turn][index_guesses] = if index_guesses == code_index
                                               "black"
                                             else
                                               "white"
                                             end
      end
      # Check if exists at the rigth index 'red hint'
    end
    @board.hints[@turn].each_with_index do |color, index|
      @board.hints[@turn][index] = "X" if color.nil?
    end
  end
end
