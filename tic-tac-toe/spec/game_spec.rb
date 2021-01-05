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
  end
end