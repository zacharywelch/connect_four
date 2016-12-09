require 'spec_helper'

describe ConnectFour::Game do

  let(:player1) { ConnectFour::Player.new('Player 1', 'x') }
  let(:player2) { ConnectFour::Player.new('Player 2', 'o') }
  let(:board)   { ConnectFour::Board.new }

  before do
    allow_any_instance_of(Array).to receive(:shuffle).and_return(
      [player2, player1])
  end
  
  subject(:game) { ConnectFour::Game.new([player1, player2], board) }

  describe '#new' do

    it { is_expected.to be_a ConnectFour::Game }

    it { is_expected.to respond_to(:players) }
    it { is_expected.to respond_to(:board) }
    it { is_expected.to respond_to(:current_player) }
    it { is_expected.to respond_to(:other_player) }

    it 'randomly selects players' do
      expect(game.current_player).to eq player2
      expect(game.other_player).to eq player1
    end
  end

  describe '#switch_players' do    
    before { game.switch_players }

    it 'swaps current player and other player' do
      expect(game.current_player).to eq player1
      expect(game.other_player).to eq player2
    end
  end

  describe '#over?' do    
    context 'when game is not over' do
      it { is_expected.to_not be_over }
    end

    context 'when game is a draw' do
      let(:board) { ConnectFour::Board.new('x') }
      it { is_expected.to be_over }
    end

    context 'when game has a winner' do
      before do
        4.times { board.drop(1, 'x') }
      end
      it { is_expected.to be_over }
    end
  end
end
