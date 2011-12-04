module TicTacToe
  class Game

    # create new game
    def initialize
      @board, @human, @opponent = Board.new, Human.new, Opponent.new
      @board.display
      if ([0,1].sample == 1)
        puts "You go first."
        @current_player = @human
      else
        puts "CPU goes first."
        @current_player = @opponent
      end
    end

    # loop until game_over
    def play
      until @board.game_over?
        if @current_player.human?
          @human.move(@board)
          @current_player = @opponent
        else
          @opponent.move(@board)
          @current_player = @human
        end
        @board.display
      end
      game_over(@board.result)
    end

    # handle game over
    def game_over(result)
      case result
        when -1.0
          puts "You lost..."
        when 0.0
          puts "Cat's game (draw)."
        when 1.0
          puts "You won!"
      end
    end

  end
end