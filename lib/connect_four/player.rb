module ConnectFour
  class Player
    attr_reader :name, :disc

    def initialize(name, disc)
      @name, @disc = name, disc
    end

    def to_s
      name
    end
  end
end
