require 'spec_helper'

describe ConnectFour::Player do

  subject(:player) { ConnectFour::Player.new('foo', 'x') }

  describe '#new' do
    it { is_expected.to be_a ConnectFour::Player }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:disc) }
  end
end
