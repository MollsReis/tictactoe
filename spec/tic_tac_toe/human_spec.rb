require 'spec_helper'

module TicTacToe
  describe Human do

    let(:human) { Human.new }

    describe '#move' do
      context 'given a valid move' do
        it 'executes the move' do
          pending #TODO
        end
      end
      context 'given an invalid move' do
        it 'asks for a valid move' do
          pending #TODO
        end
      end
    end

    describe '#mark' do
      it 'should return X' do
        human.mark.should === 'X'
      end
    end

    describe '#human?' do
      it 'should return true' do
        human.human?.should be_true
      end
    end

  end
end