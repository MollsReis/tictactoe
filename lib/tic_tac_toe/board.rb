module TicTacToe
  class Board

    def initialize
      3.times { (@board ||= []) << [SPACE_EMPTY, SPACE_EMPTY, SPACE_EMPTY] }
    end

    # display game grid with x's and o's
    def display
      puts "   1   2   3 "
      puts "A: #{@board[0][0]}  | #{@board[0][1]}  | #{@board[0][2]}  "
      puts "  -----------"
      puts "B: #{@board[1][0]}  | #{@board[1][1]}  | #{@board[1][2]}  "
      puts "  -----------"
      puts "C: #{@board[2][0]}  | #{@board[2][1]}  | #{@board[2][2]}  "
    end

    # update board with move
    def update!(mark, coords, raw = false)
      coords = translate_move(coords) unless raw
      @board[coords.first][coords.last] = mark
    end

    # return array of possible moves
    def possible_moves
      moves = []
      [0,1,2].each do |row|
        [0,1,2].each do |col|
          moves << [row,col] if @board[row][col] == SPACE_EMPTY
        end
      end
      moves
    end

    # return true/false for terminal condition
    def game_over?
      !result.nil?
    end

    # return true/false for valid move
    def valid_move?(move)
      space ~ /[ABC][123]/ && space(move) == SPACE_EMPTY
    end

    # return winner/draw
    def result
      {SPACE_X => GAME_PLAYER_X_WIN, SPACE_O => GAME_PLAYER_O_WIN}.each do |mark, val|

        # row win
        [0,1,2].each { |row| return val if @board[row][0] == mark && @board[row][1] == mark && @board[row][2] == mark }

        # column win
        [0,1,2].each { |col| return val if @board[0][col] == mark && @board[1][col] == mark && @board[2][col] == mark }

        # diagonal win
        return val if @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark
        return val if @board[2][0] == mark && @board[1][1] == mark && @board[0][2] == mark

      end

      # board isn't full
      return nil if @board.flatten.include?(SPACE_EMPTY)

      # cats game (draw)
      GAME_DRAW
    end

    # return value of space
    def space(coords)
      indices = translate_move(coords)
      @board[indices.first][indices.last]
    end

    # change coords into array coords
    def translate_move(coords)
      row = coords[0].tr('abc','012').to_i
      col = coords[0].to_i - 1
      [row, col]
    end

  end
end
