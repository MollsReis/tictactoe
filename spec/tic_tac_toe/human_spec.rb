require 'spec_helper'

module TicTacToe
  describe Human do

    let(:human) { Human.new }

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