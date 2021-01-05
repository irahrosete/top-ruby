require_relative "../lib/player"

module TicTacToe
  describe Player do
    it "raises an exception when player name and player side are not provided" do
      expect {Player.new({})}.to raise_error(KeyError)
    end
    it "does not raise an exception when player name and player side are provided" do
      input = {side: "X", name: "irah"}
      expect {Player.new(input)}.to_not raise_error
    end
    it "returns the player's side" do
      input = {side: "X", name: "irah"}
      player = Player.new(input)
      expect(player.side).to eq "X"
    end
    it "returns the player's name" do
      input = {side: "X", name: "irah"}
      player = Player.new(input)
      expect(player.name).to eq "irah"
    end
  end
end