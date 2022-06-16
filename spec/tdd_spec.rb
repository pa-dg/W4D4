require 'rspec'
require 'tdd'

describe Array do
    subject(:array) { [1, 2, 3, 1, 2] }

    describe '#my_uniq' do
        it 'accepts an array' do
            expect{ array.my_uniq }.to_not raise_error
        end

        it 'returns unique array' do
            expect(array.my_uniq).to eq([1,2,3])
        end
    end
    
    

    describe '#two_sum' do
        let(:arr) { [-1, 0, 2, -2, 1] }
        it 'finds all pairs of positions where the elements at those positions sum to zero' do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe '#my_transpose' do
        let(:arr) {
        [[0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]]
        }

        it "does not accept 1-D arrays" do
            expect{[1,2,3].my_transpose}.to raise_error(TypeError)
        end

        it "all of the sub-arrays are same length" do
            expect{[[1],[1,2]].my_transpose}.to raise_error(IndexError)
        end

        it "transposes the matrix" do
            expect(arr.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
        end
    end

    describe "#stock_picker" do
        let(:stocks) {[70,50,10,20,20,15,70]}
        it "returns nil if you can not make any money" do
          expect([5,4,3,2,1].stock_picker).to eq(nil)  
        end
        it "returns an array of length 2" do
            len = stocks.stock_picker
            expect(len.length).to eq(2)
        end

        it "picks the best days to buy and sell" do
            expect(stocks.stock_picker).to eq([2,6])
        end

    end
    
end