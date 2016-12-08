module ConnectFour
  class Board
    attr_reader :rows, :columns, :spaces
    
    def initialize
      @rows, @columns = 6, 7
      @spaces = Array.new(rows) { Array.new(columns) }
    end

    def drop(column, disc)
      row, column = next_available_space(column)
      @spaces[row][column] = disc
    end

    private
    
    def next_available_space(column)
      spaces.each_with_index do |space, row|
        break row, column if space[column].nil?
      end
    end
  end
end
