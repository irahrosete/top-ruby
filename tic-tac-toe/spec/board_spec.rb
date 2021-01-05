require_relative "../lib/board"

module TicTacToe
  describe Board do

    it "initializes the board with a grid" do
      expect {Board.new(grid: "grid")}.to_not raise_error
    end

    it "sets the grid with three rows by default" do
      board = Board.new
      expect(board.grid.size).to eq 3
    end

    it "sets each row of the grid with three cells by default" do
      board = Board.new
      board.grid.each do |row|
        expect(row.size).to eq 3
      end
    end

    it "returns the grid" do
      board=Board.new(grid: "grid")
      expect(board.grid).to eq "grid"
    end

  end
end