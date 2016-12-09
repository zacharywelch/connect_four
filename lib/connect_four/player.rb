module ConnectFour
  class Player
    attr_reader :name, :disc

    def initialize(name, disc)
      @name, @disc = name, disc
    end
  end
end
