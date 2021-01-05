require_relative "../lib/cell"

module TicTacToe
  describe Cell do
    it "is initialized with an empty value by defult" do
      cell = Cell.new
      expect(cell.value).to eq ""
    end
    it "can be initialized with a value of 'X'" do
      cell = Cell.new("X")
      expect(cell.value).to eq "X"
    end
  end
end