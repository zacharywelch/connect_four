require 'spec_helper'

describe ConnectFour::Board do

  subject(:board) { ConnectFour::Board.new }
  
  describe '#new' do

    let(:spaces) do
      [[nil, nil, nil, nil, nil, nil, nil], 
       [nil, nil, nil, nil, nil, nil, nil], 
       [nil, nil, nil, nil, nil, nil, nil], 
       [nil, nil, nil, nil, nil, nil, nil], 
       [nil, nil, nil, nil, nil, nil, nil], 
       [nil, nil, nil, nil, nil, nil, nil]]
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
end
