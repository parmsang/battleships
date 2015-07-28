require 'ship'

describe Ship do
  describe '#sizes' do
    it { is_expected.to respond_to(:sizes).with(1).argument }

    it 'should raise error if invalid ship size is given' do
      expect { subject.sizes(!1) }.to raise_error 'That is not a valid selection'
    end

    it 'should create a ship the size of the input' do
      subject.sizes(1)
      expect(subject.size).to eq 1
    end
  end

  describe '#rotate' do
    it { is_expected.to respond_to(:rotate).with(1).argument }

    it 'should raise error if invalid rotation is given' do
      expect { subject.sizes(!%w(NS EW)) }.to raise_error 'That is not a valid selection'
    end

    it "choose ship's direction" do
      subject.rotate('NS' || 'EW')
      expect(subject.rotation).to eq ('NS' || 'EW')
    end
  end

  describe '#hit' do
    it {is_expected.to respond_to(:hit) }
    it {is_expected.to respond_to(:hit?)}

    it "should not be hit when initiated" do
      expect(subject.hit?).to be false
    end

    it "should register as being hit when hit by opponent" do
      subject.hit
      expect(subject.hit?).to be true
    end
  end

  describe "#sunk?" do
    it { is_expected.to respond_to(:sunk?)}
    it "if all parts of the ship are hit it is sunk!" do
      subject.hit
      expect(subject.sunk?).to be true
    end
  end
end
