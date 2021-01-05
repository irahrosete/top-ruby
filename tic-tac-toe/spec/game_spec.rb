require_relative "../lib/game"

module TicTacToe
  describe Game do

    let(:bob) {Player.new({mark: "X", name: "bob"})}
    let(:cris) {Player.new({mark: "O", name: "cris"})}

    context "#initialize" do
      it "randomly selects current player" do
        allow_any_instance_of(Array).to receive(:shuffle) {[bob, cris]}
        game = Game.new([bob, cris])
        expect(game.current_player).to eq bob
      end
      it "randomly selects other player" do
        allow_any_instance_of(Array).to receive(:shuffle) {[bob, cris]}
        game = Game.new([bob, cris])
        expect(game.other_player).to eq cris
      end
    end

    context "#switch_players" do
      it "will set current player to other player" do
        game = Game.new([bob, cris])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end
      it "will set other player to current player" do
        game = Game.new([bob, cris])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

  end
end