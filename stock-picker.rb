def stock_picker(prices)
    max = -1.0/0.0
    best = []
    buy_day = 0
    prices.each { |buy_price|
        sell_day = buy_day
        prices[buy_day+1...].each { |sell_price|
            sell_day += 1
            if sell_price - buy_price > max
                best = [buy_day, sell_day]
                max = sell_price - buy_price
            end
        }
        buy_day += 1
    }
    return best
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s