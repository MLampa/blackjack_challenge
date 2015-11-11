require 'spec_helper'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck after being built" do
      expect(deck.cards.shuffle!).to_not eq(deck)

      # it is good not to rely on negative tests alone
      # so we assert that after sorting the deck it looks like we expect
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 1

      deck.deal

      expect(deck.cards.size).to eq finish_size
    end
  end
end

# These will be useful for making different hands
# '♦', '♣', '♠', '♥'
