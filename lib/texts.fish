function rules
    echo "==========RULES=========="
    echo "1. You start with 100 money and 0 lemons."
    echo "2. Each day you can choose to buy lemons form the market, plant, harvest or press lemons into lemonade."
    echo "3. At the end of the day your leomonade will spoil."
    echo "4. The goal is to make as much money as possible by the end of the game."
    echo "5. Weather affects the success of your lemonade sales."
end


# Pirces for buying lemons and selling lemonade
function prices
    echo "==========PRICES=========="
    echo "1. Lemon seeds cost 2 money each. They need 1 day to grow into lemons."
    echo "2. Lemons from the market cost 5 money each."
    echo "3. Each lemon can be pressed into 1 lemonade."
    echo "4. Each lemonade can be sold for 10 money."
end

function dailySummary --argument-names customers sold earnings lemons_grown
    echo "==========DAY SUMMARY=========="
    echo "Customers: $customers"
    echo "Lemonade sold: $sold"
    echo "Money earned: $earnings"
    echo "Lemons grown: $lemons_grown"
end
