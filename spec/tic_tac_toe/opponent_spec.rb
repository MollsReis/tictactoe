require 'spec_helper'

module TicTacToe
  describe Opponent do

    let(:opponent) { Opponent.new }
    let(:board)    { Board.new }

    describe '#move' do
      context 'given a board' do
        it 'updates the board with the best move' do
          opponent.stub!(:best_move).and_return({[0,0] => -1.0})
          opponent.move(board)
          board.instance_variable_get(:@board).should === [['O',' ',' '],[' ',' ',' '],[' ',' ',' ']]
        end
      end
    end

    describe '#mark' do
      it 'returns O' do
        opponent.mark.should === 'O'
      end
    end

    describe '#human?' do
      it 'returns false' do
        opponent.human?.should be_false
      end
    end

    describe '#best_move' do
      it 'calculates the best move recursively' do
        # immediate win
        board.instance_variable_set(:@board, [[' ',' ',' '],['O','O',' '],[' ',' ',' ']])
        opponent.best_move(board,:min).should === {[1,2] => -1.0}
        # prevent immediate opponent win (and win in 2 moves)
        board.instance_variable_set(:@board, [['O',' ','X'],[' ','X',' '],[' ',' ','O']])
        opponent.best_move(board,:min).should === {[2,0] => -0.81}
      end
    end

  end
end