class Card

    attr_reader :suit, :value

    FACE_CARDS = {
            11 => "J", 
            12 => "Q",
            13 => "K", 
            14 => "A" }

    SUITS = {
            "Heart" => "♥", 
            "Club" => "♣",
            "Diamond" => "♦", 
            "Spade" => "♠" }

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    def to_s
        if @value > 10
            return FACE_CARDS[@value] + SUITS[@suit]
        else
            return value.to_s + SUITS[@suit]
        end
    end
    
end
