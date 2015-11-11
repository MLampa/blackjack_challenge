require 'spec_helper'

describe Hand do
  let(:hand) { Hand.new([Card.new("10","♦"), Card.new("J","♥")]) }
  let(:hand1) { Hand.new([Card.new("5","♦"), Card.new("J","♥")]) }
  let(:hand2) { Hand.new([Card.new("A","♥"), Card.new("10","♥")]) }
  let(:hand3) { Hand.new([Card.new("10","♦"), Card.new("J","♥"), Card.new("10","♦")])}

  describe "#calculate_hand" do
    # Sample tests (change these once you understand)
    it "passes" do
      # use `expect` to test assertions
      expect(hand.calculate_hand).to eq(20)
    end

    it "passes" do
      expect(hand1.calculate_hand).to eq(15)
    end

    it "passes" do
      expect(hand2.calculate_hand).to eq(21)
    end

    it "fails" do
      expect(hand3.calculate_hand).to eq(30)
    end

    # add the remaining tests here
  end
end
