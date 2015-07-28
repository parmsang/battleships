require 'board'

describe Board do
  describe '#place' do
  	it { is_expected.to respond_to(:place).with(1).argument }
    it 'places ship in board location' do
      ship = double :ship
      subject.place ship
      expect((subject.board).last).to eq ship
    end
  end
end
