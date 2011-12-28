module TicTacToe
  class Opponent

    DECAY = 0.9

    # choose next move
    def move(board)
      board.update!(mark, best_move(board, :min), true)
    end

    # return O (mark of player)
    def mark
      SPACE_O
    end

    # return false
    def human?
      false
    end

    # calculate value of move(s) recursively
    def best_move(board, max_min)
      poss_moves = {}
      board.possible_moves.each do |move|
        future_board = board
        future_board.update!(mark, move, true)
        result = future_board.result
        if !result.nil?
          poss_moves[move] = result
        else
          if max_min == :min
            poss_moves[move] = best_move(future_board, :max).values.first.to_f * DECAY
          else
            poss_moves[move] = best_move(future_board, :min).values.first.to_f * DECAY
          end
        end
      end
      if max_min == :min
        val = poss_moves.values.min
      else
        val = poss_moves.values.min
      end
      poss_moves.select { |k,v| v == val }.first
    end

  end
end
