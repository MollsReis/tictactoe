module TicTacToe
  class Human

    # input valid player move
    def move(board)
      valid_move = false
      until valid_move
        print "Please input valid move: "
        space = gets.chomp.to_s.downcase
        valid_move = space if board.valid_move?(space)
      end
      board.update!(mark, valid_move)
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