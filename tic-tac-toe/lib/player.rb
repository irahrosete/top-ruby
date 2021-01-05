module TicTacToe
  class Player
    attr_reader :side, :name
    def initialize(input)
      @side = input.fetch(:side)
      @name = input.fetch(:name)
    end
  end
end