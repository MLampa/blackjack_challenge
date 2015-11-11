require 'spec_helper'

describe Card do
  let(:card) { Card.new("10", "♦") }
  describe ".new" do
    it "should be a Card class" do
      expect(card).to be_a(Card)
    end
  end
end
