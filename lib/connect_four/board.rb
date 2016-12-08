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
      winning_row? || winning_column?
    end

    private

    def next_available_space(column)
      spaces.each_with_index do |space, row|
        break row, column if space[column] == BLANK
      end
    end

    def winning_row?
      spaces.any? { |row| row.join.match(/(\w)\1{3}/) }
    end

    def winning_column?
      spaces.transpose.any? { |column| column.join.match(/(\w)\1{3}/) }
    end
  end
end
