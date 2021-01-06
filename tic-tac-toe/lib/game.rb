module TicTacToe
  class Game

    attr_reader :players, :board, :current_player, :other_player

    def initialize (players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}'s move. #{current_player.mark}"
    end

    def get_move (human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    # private
    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2],
      }
      mapping[human_move]
    end

    def game_over_message
      return "#{current_player.name} won!\n\n" if board.game_over == :winner
      return "the game is a draw!\n\n" if board.game_over == :draw
    end

    def play
      while true
        puts "Use the numbers 1-9 to place your mark on the board."
        puts "\n"
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.mark)
        if board.game_over
          system "clear"
          board.formatted_grid
          puts "\n"
          puts game_over_message
          return
        else
          switch_players
        end
        system "clear"
      end
    end

  end
end