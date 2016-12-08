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
      winning_row? || winning_column? || winning_diagonal?
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

    def winning_diagonal?
      diagonals.any? { |diagonal| diagonal.join.match(/(\w)\1{3}/) }
    end

    def diagonals
      [[spaces[0][0], spaces[1][1], spaces[2][2], spaces[3][3], spaces[4][4], 
        spaces[5][5]],
       [spaces[0][1], spaces[1][2], spaces[2][3], spaces[3][4], spaces[4][5], 
        spaces[5][6]],
       [spaces[0][2], spaces[1][3], spaces[2][4], spaces[3][5], spaces[4][6]],
       [spaces[0][3], spaces[1][4], spaces[2][5], spaces[3][6]],
       [spaces[1][0], spaces[2][1], spaces[3][2], spaces[4][3], spaces[5][4]],
       [spaces[2][0], spaces[3][1], spaces[4][2], spaces[5][3]],
       
       [spaces[0][6], spaces[1][5], spaces[2][4], spaces[3][3], spaces[4][2], 
        spaces[5][1]],
       [spaces[0][5], spaces[1][4], spaces[2][3], spaces[3][2], spaces[4][1], 
        spaces[5][0]],
       [spaces[0][4], spaces[1][3], spaces[2][2], spaces[3][1], spaces[4][0]],
       [spaces[0][3], spaces[1][2], spaces[2][1], spaces[3][0]],
       [spaces[1][6], spaces[2][5], spaces[3][4], spaces[4][3], spaces[5][2]],
       [spaces[2][6], spaces[3][5], spaces[4][4], spaces[5][3]]]
    end
  end
end
