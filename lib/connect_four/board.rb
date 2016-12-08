module ConnectFour
  class Board
    attr_reader :rows, :columns, :spaces
    BLANK = ' '    
    
    def initialize(default = BLANK)
      @rows, @columns = 6, 7
      @spaces = Array.new(rows) { Array.new(columns, default) }
    end

    def drop(column, disc)
      row, column = next_available_space(column)
      @spaces[row][column] = disc
    end

    def draw?
      spaces.flatten.none? { |space| space == BLANK }
    end

    def won?
      spaces.any? { |row| row.join.match(/(\w)\1{3}/) }
    end

    private

    def next_available_space(column)
      spaces.each_with_index do |space, row|
        break row, column if space[column] == BLANK
      end
    end
  end
end
