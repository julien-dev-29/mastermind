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
    @code = COLOR.keys.to_a.sample(4)
  end

  def play
    loop do
      system("clear") || system("cls")
      @board.display
      # Si le joueur a gagné ou perdu, on sort de la boucle
      if @turn >= 12
        display_result(false)
        break
      end
      guess = get_player_guess
      @board.guesses_history[@turn] = guess
      check_code(guess)
      # Vérifier si le joueur a gagné
      if @board.winner?(@board.hints[@turn])
        display_result(true)
        break
      end
      @turn += 1
    end
  end

  def display_result(win)
    system("clear") || system("cls")
    @board.display
    puts "-----------------------------------------------------"
    if win
      puts "-                🎉 VICTOIRE ! 🎉                     -"
      puts "-   Tu as trouvé le code en #{@turn + 1} tentatives !   -"
    else
      puts "-                💥 DÉFAITE... 💥                     -"
      puts "-   Le code était : #{@code.map { |c| Game::COLOR[c] }.join(' ')}   -"
    end
    puts "-----------------------------------------------------"
  end

  def get_player_guess
    guess = []
    4.times do |i|
      loop do
        print "Color #{i + 1} (1-#{COLOR.size}): "
        input = gets.chomp
        if valid_input?(input)
          guess << COLOR.keys[input.to_i - 1]
          break
        else
          puts "Invalid input. Choose a number between 1 and #{COLOR.size}."
        end
      end
    end
    guess
  end

  def check_code(guess)
    hints = Array.new(4)
    code_copy = @code.dup
    guess_copy = guess.dup
    guess_copy.each_with_index do |color, index|
      if color == code_copy[index]
        hints[index] = "black"
      elsif code_copy.include?(color)
        hints[index] = "white"
      end
    end
    @board.hints[@turn] = hints
  end

  def valid_input?(input)
    number = input.to_i
    number.between?(1, COLOR.size)
  end
end
