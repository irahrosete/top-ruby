require_relative "../lib/board"

module TicTacToe
  describe Board do
    it "initializes the board with a grid" do
      expect {Board.new(grid: "grid")}.to_not raise_error
    end
  end
end