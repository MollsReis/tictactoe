module TicTacToe
  class Human

    # input valid player move
    def move(board)
      until valid_move
        put "Please input valid move: "
        space = gets.chomp.to_s
        valid_move = space if board.valid_move?(space)
      end
      board.update_grid!(mark, valid_move)
    end

    # return X (mark of player)
    def mark
      SPACE_X
    end

    # return true
    def human?
      true
    end

  end
end