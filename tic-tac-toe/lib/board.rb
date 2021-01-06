module TicTacToe
  class Board

    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def default_grid
      Array.new(3) {Array.new(3) {Cell.new}}
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def formatted_grid
      grid.each do |row|
        puts row.map {|cell| cell.value.empty? ? "⬜" : cell.value}.join("")
      end
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def draw?
      grid.flatten.map {|cell| cell.value}.none_empty?
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [[get_cell(0, 0), get_cell(1, 1), get_cell(2,2)], [get_cell(0,2), get_cell(1, 1), get_cell(2, 0)]]
    end

    def winner?
      winning_positions.each do |winning_positions|
        next if winning_positions_values(winning_positions).all_empty?
        return true if winning_positions_values(winning_positions).all_same?
      end
      false
    end

    def winning_positions_values(winning_positions)
      winning_positions.map {|cell| cell.value}
    end

  end
end