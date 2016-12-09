module ConnectFour
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def over?
      board.draw? || board.winner?
    end

    def next_move
      switch_players
      board.draw
      printf "#{current_player.name} what's your move? "
      gets.chomp.to_i
    end

    def play
      until over?
        move = next_move
        board.drop(move - 1, current_player.disc)
      end
      if board.winner?
        board.draw
        puts "#{current_player} won!"
      else
        board.draw
        puts "It's a draw!"
      end
    end
  end
end
