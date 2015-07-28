require 'board'

describe Board do
  let (:ship){double :ship}
  describe '#place' do
    it { is_expected.to respond_to(:place).with(3).argument }
    it 'places ship in board location' do
      subject.place(ship,1,1)
      expect((subject.board)[0] [0]).to eq ship
    end
    it "Should raise error if ship is not placed on board" do
      expect {subject.place(ship,0,0)}.to raise_error "Placement is outside board coordiantes"
    end
    it "Should raise error if ship is placed on existing ship" do
      subject.place(ship,1,1)
      expect{subject.place(ship,1,1)}.to raise_error "Ship exists at that location!"
    end
  end
  describe "#fire" do
  	it { is_expected.to respond_to(:fire).with(2).argument }
    it "Should fire at the board" do
      subject.fire(1,1)
      expect(subject.fired[0][0]).to eq true
    end
    it "Should raise error if fired outside of the board" do
      expect {subject.fire(0,0)}.to raise_error "You fired outside board coordiantes"
    end
    it "Should raise error if fired on previously fired location" do
      subject.fire(10,10)
      expect{subject.fire(10,10)}.to raise_error "You have already fired at this location"
    end

    it "Should hit the ship" do
      ship = spy :ship
      subject.place(ship,1,1)
      subject.fire(1,1)
      expect(ship).to have_received :hit
    end
  end
end
