require_relative 'card'

class Deck

    attr_accessor :deck

    def self.shuffled_deck
        new_deck = Deck.new
        new_deck.deck = new_deck.deck.shuffle
        return new_deck
    end

    def initialize
        @value = (1..14).to_a
        @suits = ["Heart", "Diamond", "Spade", "Club"]
        @deck = []
        @value.product(@suits).each do |card|
            @deck << Card.new(card[1], card[0])
        end
    end

    def display
        @deck.each do |el|
            puts el.to_s
        end
    end

end

d = Deck.shuffled_deck
d.display