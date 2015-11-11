class Hand
  attr_accessor :cards
  attr_reader :player
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
      value = 0
      ace_count = 4
      @cards.each do |card|
        card = card.rank
        if  card == 'J' || card == 'Q' || card == 'K'
          value += 10
        elsif card == 'A'
          value += 1
          ace_count -= 1
          while (value < 10) && (ace_count <= 4)
            value += 10
          end
        else
          value += card.to_i
        end
      end
      value

  end
end
