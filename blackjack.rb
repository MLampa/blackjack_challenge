require 'pry'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'


class Blackjack
  attr_reader :name
  attr_accessor :deck, :cards, :hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new([])
    @dealer_hand = Hand.new([])
    @hand = Hand.new(cards)
  end

  def play
    puts "Let's play some blackjack"

    2.times do
      @player_hand.cards << @deck.deal
      @dealer_hand.cards << @deck.deal
    end

    @player_hand.cards.each do |card|
      puts "Player's hand: #{card.rank}#{card.suit}"
    end
    blackjack
    hit_or_stand

    @dealer_hand.cards.each do |card|
      puts "Dealer's hand: #{card.rank}#{card.suit}"

    end
    blackjack
    while @dealer_hand.calculate_hand <= 17
      new_card = @deck.deal
      @dealer_hand.cards << new_card
      puts "The Dealer hit."
      puts "Dealer got dealt: #{new_card.rank}#{new_card.suit}"
      puts "#{@dealer_hand.calculate_hand}\n"
    end
    results
  end

  def hit_or_stand
    while @player_hand.calculate_hand < 21
      puts "Would you like to hit or stand? (h/s)"
      hit = gets.chomp.downcase
      if hit == "h"

        new_player_card = @deck.deal
        @player_hand.cards << new_player_card
        puts "You got dealt: #{new_player_card.rank}#{new_player_card.suit}"
        puts "#{@player_hand.calculate_hand}\n\n"

      elsif hit == "s"
        @player_hand.calculate_hand
        break
      end
    end
  end

  def blackjack
    if @player_hand.calculate_hand == 21
      puts "\nBlackjack! Player 1 wins!"
    elsif @dealer_hand.calculate_hand == 21
      puts "\nBlackjack! The Dealer has won this round."
    elsif (@player_hand.calculate_hand == @dealer_hand.calculate_hand) && (@player_hand.calculate_hand == 21)
      puts "Blackjack! It's a draw. No one wins and no one loses."
    else
    end
  end

  def results
    if (@player_hand.calculate_hand == @dealer_hand.calculate_hand) && (@player_hand.calculate_hand <= 21)
      puts "\nDraw! No one wins. No one loses."
    elsif (@player_hand.calculate_hand > @dealer_hand.calculate_hand) && (@player_hand.calculate_hand <= 21) && (@dealer_hand.calculate_hand <= 21)
      puts "\nPlayer 1's #{@player_hand.calculate_hand} beats the Dealer's #{@dealer_hand.calculate_hand}"
    elsif (@player_hand.calculate_hand <= 21) && (@dealer_hand.calculate_hand > 21)
      puts "\nThe Dealer busts. Player 1 wins!"
    elsif (@dealer_hand.calculate_hand > @player_hand.calculate_hand) && (@player_hand.calculate_hand <= 21) && (@dealer_hand.calculate_hand <= 21)
      puts "\nThe Dealer's #{@dealer_hand.calculate_hand} beats Player 1's #{@player_hand.calculate_hand}."
    elsif (@dealer_hand.calculate_hand <= 21) && (@player_hand.calculate_hand > 21)
      puts "\nYou bust. The Dealer wins!"
    elsif (@dealer_hand.calculate_hand > 21) && (@player_hand.calculate_hand > 21)
      puts "\nYou both busted. No one wins. No one loses."
    else
      puts "\nSorry... I lost count."
    end
  end

end



 game = Blackjack.new
 game.play
