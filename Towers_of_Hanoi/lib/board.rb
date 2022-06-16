

class Board

    attr_reader :discs

    def initialize(discs = 3)
        @discs = discs
        @arr1 = []
        @arr2 = []
        @arr3 = []
        @board = [@arr1,@arr2,@arr3]
        (1..discs).each do |i|
            @arr1.unshift(i)
        end
    end

    def display
        print @arr1
        puts
        print @arr2
        puts
        print @arr3
        puts
    end

    def get_input
        puts "Enter your start position"
        input1 = gets.chomp.to_i

        puts "Enter your end position"
        input2 = gets.chomp.to_i
        valid_moves?(input1, input2)

        @board[input2-1].push(@board[input1-1].pop)
        #return [input1, input2]
    end
    
    def valid_moves?(start_pos, end_pos)
        raise ArgumentError unless (1..3).to_a.include?(start_pos) && (1..3).to_a.include?(end_pos)
        raise NoDiscError if @board[start_pos-1].length == 0
        return true if @board[end_pos-1].length == 0
        raise "Invalid Move" if @board[end_pos-1][-1] < @board[start_pos-1][-1]
    end
    
    def won?
        return @arr3.length == discs
    end

    def play
        until self.won?
            begin
                system("clear")
                self.display
                self.get_input
            rescue ArgumentError
                puts "Out of Range!"
                sleep(2)
                retry               
            rescue NoDiscError
                
                puts "There are no discs there!"
                sleep(2)
                retry
            rescue
                puts "Invalid Move!"
                sleep(2)
                retry
            end
        end

        system("clear")
        puts "You won!"
    end

    
end
class NoDiscError < StandardError; end

b = Board.new
b.play


    