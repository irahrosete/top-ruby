require_relative "../lib/player"

module TicTacToe
  describe Player do
    it "raises an exception when player name and player mark are not provided" do
      expect{Player.new({})}.to raise_error(KeyError)
    end
    it "does not raise an exception when player name and player mark are provided" do
      input = {mark: "X", name: "irah"}
      expect{Player.new(input)}.to_not raise_error
    end
    it "returns the player's mark" do
      input = {mark: "X", name: "irah"}
      player = Player.new(input)
      expect(player.mark).to eq "X"
    end
    it "returns the player's name" do
      input = {mark: "X", name: "irah"}
      player = Player.new(input)
      expect(player.name).to eq "irah"
    end
  end
end