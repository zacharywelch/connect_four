module ConnectFour
  class Board
    attr_reader :rows, :columns, :spaces
    
    def initialize
      @rows, @columns = 6, 7
      @spaces = Array.new(rows) { Array.new(columns) }
    end
  end
end
