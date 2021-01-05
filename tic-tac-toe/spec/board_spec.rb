require_relative "../lib/board"

module TicTacToe
  describe Board do

    context "#initialize" do
      it "initializes the board with a grid" do
        expect{Board.new(grid: "grid")}.to_not raise_error
      end
    end

    context "#default_grid" do
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

    context "#get_cell" do
      it "returns cell based on the (x, y) coordinate" do
        grid = [["", "", ""], ["X", "", ""], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(0,1)). to eq "X"
      end
    end

    # it "updates the value of the cell at (x, y) coordinate" do
    #   Tic = Struct.new(:value)
    #   grid = [[Tic.new("X"), "", ""], ["", "", ""], ["", "", ""]]
    #   board = Board.new(grid: grid)
    #   board.set_cell(0, 1, "O")
    #   expect(board.get_cell(0, 1).value).to eq "O"
    # end

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) {true}
        # board.stub(:winner?) {true}
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) {false}
        allow(board).to receive(:draw?) {true}
        expect(board.game_over).to eq :draw
      end

      it "keeps game on if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?) {false}
        allow(board).to receive(:draw?) {false}
        expect(board.game_over).to be_falsey
      end
    end


  end
end