require 'spec_helper'

describe ConnectFour::Board do

  subject(:board) { ConnectFour::Board.new }
  
  describe '#new' do

    let(:spaces) do
      [[' ', ' ', ' ', ' ', ' ', ' ', ' '], 
       [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
       [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
       [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
       [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
       [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
    end
    
    it { is_expected.to be_a ConnectFour::Board }

    it 'has 7 columns' do
      expect(board.columns).to be 7
    end

    it 'has 6 rows' do
      expect(board.rows).to be 6
    end

    it 'is empty by default' do
      expect(board.spaces).to eq spaces
    end
  end

  describe '#drop' do

    it 'places disc on the board' do
      expect(board.drop(0, 'x')).to be_truthy
    end

    it 'places disc at first available spot' do
      board.drop(1, 'x')
      expect(board.spaces[0][1]).to eq 'x'
    end
  end

  describe 'draw?' do

    context 'when board is not full' do
      it { is_expected.to_not be_a_draw }
    end

    context 'when board is full' do
      subject(:board) { ConnectFour::Board.new('x') }
      it { is_expected.to be_a_draw }
    end
  end

  describe 'won?' do
    
    context 'when there are no winners' do
      it { is_expected.to_not be_won }
    end

    context 'when there is a winning row' do
      before do
        board.drop(1, 'x')
        board.drop(2, 'x')
        board.drop(3, 'x')
        board.drop(4, 'x')
      end

      it { is_expected.to be_won }
    end

    context 'when there is a winning column' do
      before do
        board.drop(1, 'x')
        board.drop(1, 'x')
        board.drop(1, 'x')
        board.drop(1, 'x')
      end

      it { is_expected.to be_won }
    end

    context 'when there is a winning right diagonal' do
      before do
        board.drop(1, 'x')
        
        board.drop(2, 'o')
        board.drop(2, 'x')

        board.drop(3, 'x')
        board.drop(3, 'o')
        board.drop(3, 'x')

        board.drop(4, 'o')
        board.drop(4, 'x')
        board.drop(4, 'o')
        board.drop(4, 'x')
      end
      
      it { is_expected.to be_won }
    end

    context 'when there is a winning left diagonal' do
      before do
        board.drop(6, 'x')
        
        board.drop(5, 'o')
        board.drop(5, 'x')

        board.drop(4, 'x')
        board.drop(4, 'o')
        board.drop(4, 'x')

        board.drop(3, 'o')
        board.drop(3, 'x')
        board.drop(3, 'o')
        board.drop(3, 'x')
      end
      
      it { is_expected.to be_won }
    end
  end  
end
