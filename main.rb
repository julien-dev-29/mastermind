require_relative "lib/game"

def welcome_screen
  system("clear") || system("cls")
  puts "====================================================="
  puts "=   🎨  BIENVENUE DANS MASTERMIND !!!  🎨            ="
  puts "=                                                   ="
  puts "=   🔴 🔵 🟢 🟡 🟠 🟣 🟤                                ="
  puts "=   Trouve le code secret en 12 essais maximum !     ="
  puts "=                                                   ="
  puts "=   Règles :                                        ="
  puts "=   - Choisis 4 couleurs parmi les 7 disponibles.   ="
  puts "=   - Après chaque essai, tu auras des indices :   ="
  puts "=     ⚫ = Bonne couleur ET bonne position          ="
  puts "=     ⚪ = Bonne couleur mais mauvaise position     ="
  puts "=                                                   ="
  puts "====================================================="
  puts "Appuie sur 1 pour jouer en tant que créateur"
  puts "Appuie sur 2 pour jouer en tant que joueur"
  input = gets.chomp
  return unless input.to_i == 2

  Game.new.play
end

welcome_screen
