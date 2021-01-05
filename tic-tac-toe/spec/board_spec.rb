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

    Tic = Struct.new(:value)
    let(:x) {Tic.new("X")}
    let(:y) {Tic.new("O")}
    let(:e) {Tic.new("")}

    it "updates the value of the cell at (x, y) coordinate" do
      grid = [
        [x, e, e],
        [e, e, e],
        [e, e, e]
      ]
      board = Board.new(grid: grid)
      board.set_cell(0, 1, "O")
      expect(board.get_cell(0, 1).value).to eq "O"
    end

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) {true}
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

      it "returns :winner when all elements of row are the same" do
        grid = [
          [x, x, x],
          [y, e, x],
          [y, y, y]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when all elements of column are the same" do
        grid = [
          [x, y, x],
          [x, e, x],
          [x, y, y]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when all elements of diagonals are the same" do
        grid = [
          [y, y, x],
          [x, y, e],
          [x, e, y]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when all elements of the board are taken" do
        grid = [
          [x, y, x],
          [x, y, x],
          [y, x, y]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when there is no winner or draw" do
        grid = [
          [x, y, e],
          [x, e, x],
          [y, e, y]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsey
      end

    end
  end
end