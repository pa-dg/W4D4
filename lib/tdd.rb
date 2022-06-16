class Array

    def my_uniq
        # return self.uniq
        uniq = Hash.new(0)
        
        self.each { |ele| uniq[ele] += 1 }

        return uniq.keys
    end

    def two_sum
        sum = []
        
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1 && ele1 + ele2 == 0
                    sum << [idx1, idx2]
                end
            end
        end

        return sum
    end

    def my_transpose
        #self.transpose
        # [[1,2,3],
        # [4,5,6]]
        raise TypeError unless self.all? {|el| el.is_a?(Array)}
        raise IndexError unless self.all? {|el| el.length == self[0].length }
        arr = []
        (0...self[0].length).each do |j|
            temp_arr = []
            self.each_with_index do |el,i|
                temp_arr << self[i][j]
            end
            arr << temp_arr
        end

        arr
    end

    def stock_picker
        increasing = false
        (0...self.length - 1).each do |i|
            increasing = true if self[i+1] > self[i]
        end
        return nil if !increasing

        arr = []
        (0...self.length-1).each do |day_1|

            pair = [day_1,day_1+1]

            (day_1+1...self.length).each do |day_2|

                if self[day_2] > self[pair[1]]
                    pair = [day_1, day_2]
                end

            end
            arr << pair

        end
        
        return arr.inject do |acc,el|
            self[acc[1]] - self[acc[0]] <  self[el[1]] - self[el[0]] ? el : acc
        end
    end

end

a = [70,50,10,20,20,15,70]
p a.stock_picker