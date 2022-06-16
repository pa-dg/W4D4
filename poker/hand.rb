require_relative 'card'

class Hand

    attr_reader :hand, :revealed
    def initialize(cards)
        @hand = cards
        @revealed = false
    end

    def reveal  #time to show
        @revealed = true
    end

    def display
        if self.revealed
            return @hand.join(" ")
        else
            return "🂠 🂠 🂠 🂠 🂠"
        end
    end

    def 
end



c1 = Card.new("Heart", 1)

c2 = Card.new("Heart", 2)

c3 = Card.new("Heart", 11)

c4 = Card.new("Heart", 14)

c5 = Card.new("Heart", 9)

h = Hand.new([c1,c2,c3,c4,c5])
#h.reveal
p h.display