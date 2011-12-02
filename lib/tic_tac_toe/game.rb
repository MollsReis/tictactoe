module TicTacToe
  class Game

    # create new game
    def initialize
      @board, @human, @opponent = Board.new, Human.new, Opponent.new
      Board.display_grid
      if ([0,1].sample == 1)
        puts "You go first."
        start_game_loop(@human)
      else
        puts "CPU goes first."
        start_game_loop(@opponent)
      end
    end

    # loop until game_over
    def start_game_loop(player)
      until @board.game_over?
        if player.human?
          @human.move(@board)
          player = @opponent
        else
          @opponent.move(@board)
          player = @human
        end
        Board.display_grid
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