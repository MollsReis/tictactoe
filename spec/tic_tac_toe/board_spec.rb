require 'spec_helper'

module TicTacToe
  describe Board do

    let(:board) { Board.new }

    describe '#initialize' do
      it 'creates a blank board' do
        board.instance_variable_get(:@board).should be_kind_of Array
      end
    end

    describe '#update!' do
      context 'given raw coords and a mark' do
        it 'updates the board with those coordinates with the mark' do
          board.update!('X', [0,0], true)
          board.instance_variable_get(:@board).should === [['X',' ',' '],[' ',' ',' '],[' ',' ',' ']]
          board.update!('O', [1,2], true)
          board.instance_variable_get(:@board).should === [['X',' ',' '],[' ',' ','O'],[' ',' ',' ']]
        end
      end
      context 'given non-raw coords and a mark' do
        it 'updates the board with those translated coordinates with the mark' do
          board.update!('X', 'a1')
          board.instance_variable_get(:@board).should === [['X',' ',' '],[' ',' ',' '],[' ',' ',' ']]
          board.update!('O', 'B3')
          board.instance_variable_get(:@board).should === [['X',' ',' '],[' ',' ','O'],[' ',' ',' ']]
        end
      end
    end

    describe '#possible_moves' do
      it 'returns an array of possible moves' do
        board.possible_moves.should === [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
        board.instance_variable_set(:@board, [%w[X X X],%w[O O O],[' ',' ',' ']])
        board.possible_moves.should === [[2,0],[2,1],[2,2]]
        board.instance_variable_set(:@board, [%w[X X X],%w[O O O],%w[X O X]])
        board.possible_moves.should be_empty
      end
    end

    describe '#game_over?' do
      context 'if the result is not nil' do
        it 'returns true' do
          board.stub!(:result).and_return(1)
          board.game_over?.should be_true
        end
      end
      context 'if the result is nil' do
        it 'returns false' do
          board.stub!(:result).and_return(nil)
          board.game_over?.should be_false
        end
      end
    end

    describe '#valid_move?' do
      context 'given a valid move' do
        context 'and given an empty space' do
          it 'should return true' do
            board.stub!(:space).and_return(' ')
            board.valid_move?('a1').should be_true
            board.valid_move?('B2').should be_true
            board.valid_move?('c3').should be_true
          end
        end
        context 'and given a taken space' do
          it 'should return false' do
            board.stub!(:space).and_return('X')
            board.valid_move?('a1').should be_false
            board.valid_move?('B2').should be_false
            board.valid_move?('c3').should be_false
          end
        end
      end
      context 'given an invalid move' do
        it 'should return false' do
          board.stub!(:space).and_return(' ')
          board.valid_move?('').should be_false
          board.valid_move?('zzz').should be_false
          board.valid_move?('A1B2').should be_false
        end
      end
    end

    describe '#result' do
      context 'given a non-result' do
        it 'returns nil' do
          board.result.should be_nil
        end
      end
      context 'given a player win' do
        it 'returns 1.0' do
          board.instance_variable_set(:@board,[['X','X','X'],[' ',' ',' '],[' ',' ',' ']])
          board.result.should === 1.0
        end
      end
      context 'given an AI win' do
        it 'returns -1.0' do
          board.instance_variable_set(:@board,[['O','O','O'],[' ',' ',' '],[' ',' ',' ']])
          board.result.should === -1.0
        end
      end
      context 'given a draw' do
        it 'returns 0.0' do
          board.instance_variable_set(:@board,[['X','X','O'],['O','O','X'],['X','O','X']])
          board.result.should === 0.0
        end
      end
    end

    describe '#space' do
      context 'given alpha-numeric coordinates' do
        it 'returns the value of that space on the game board' do
          board.instance_variable_get(:@board)[0][0] = 1
          board.instance_variable_get(:@board)[2][1] = 2
          board.instance_variable_get(:@board)[1][2] = 0

          board.space('A1').should === 1
          board.space('c2').should === 2
          board.space('b3').should === 0
        end
      end
    end

    describe '#translate_move' do
      context 'given alpha-numeric coordinates' do
        it 'should translate them into array indices' do
          board.translate_move('a1').should === [0,0]
          board.translate_move('B2').should === [1,1]
          board.translate_move('c3').should === [2,2]
        end
      end
    end

  end
end