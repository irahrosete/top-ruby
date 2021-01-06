require_relative "cell"
require_relative "player"
require_relative "board"
require_relative "array"
require_relative "game"


puts "Welcome to tic tac toe"
bob = TicTacToe::Player.new({mark: "❌", name: "bob"})
cris = TicTacToe::Player.new({mark: "🔵", name: "cris"})
players = [bob, cris]
TicTacToe::Game.new(players).play