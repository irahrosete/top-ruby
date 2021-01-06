require_relative "cell"
require_relative "player"
require_relative "board"
require_relative "array"
require_relative "game"

puts "Welcome to tic tac toe\n\n"
puts "Enter player1's name"
p1 = gets.chomp
puts "Enter player2's name"
p2 = gets.chomp
puts "\n"

player1 = TicTacToe::Player.new({mark: "❌", name: p1})
player2 = TicTacToe::Player.new({mark: "🔵", name: p2})
players = [player1, player2]
TicTacToe::Game.new(players).play