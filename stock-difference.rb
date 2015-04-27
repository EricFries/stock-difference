
# find the greatest difference between two elements in the array.

#the buy (higher number) must come earlier in the array, e.g., lower index number

#calculate a greatest difference so far

#stock_prices_yesterday[500, 499, 498, ]

#480 index numbers (8 hours x 60 mins)
#generate 480 random numbers with 5% flucuation from 500 price (475-525)

class StockDifferenceCalculator
  attr_accessor :stock_prices_yesterday, :buy_price, :sell_price, :biggest_profit

  def initialize
    build_array
    find_greatest_profit
  end

  def build_array
    @stock_prices_yesterday = []
    (8*60).times do
      @stock_prices_yesterday << rand((500*0.95)...(500*1.05)).round(2)
    end
    @stock_prices_yesterday
  end

  #Iterate through price array. Compare current element with only those after it to find greatest difference between them.
  def find_greatest_profit

    @stock_prices_yesterday.each.with_index do |buy_amount, index|

      #Set biggest profit to the first transaction to avoid errors caused by a comparision with nil.
      @biggest_profit ||= @stock_prices_yesterday[0] - @stock_prices_yesterday[1]

      counter = 1
      while index + counter < 480
        if (@stock_prices_yesterday[index + counter] - buy_amount) > @biggest_profit
          @biggest_profit = @stock_prices_yesterday[index + counter] - buy_amount
          @buy_price = @stock_prices_yesterday[index]
          @buy_time = index
          @sell_price = @stock_prices_yesterday[index + counter]
          @sell_time = index + counter
          counter += 1
          puts counter
        else
          counter +=1
          puts counter
        end
      end
    end
    @biggest_profit
  end
end

StockDifferenceCalculator.new