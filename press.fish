#!/usr/bin/env fish

source (dirname (status filename))/lib/texts.fish
source (dirname (status filename))/lib/weather.fish
source (dirname (status filename))/lib/customers.fish

echo "Welcome to presssed"
echo "====================="
echo "A game to plant, harvest and press lemons into lemonade"

# Creating initial varriables
set day 1
set lemons 0
set seeds 0
set planted_lemons 0
set customers 0
set customer_multiplier 1
set money 50 # starting money
set lemonade 0
set weather ""

read -P "Press any key to start" -n 1 start

read -P "Do you know the rules of the game? (y/n) " answer_rules
if test $answer_rules = "y"
    echo "Great! Let's start the game."
else if test $answer_rules = "n"
    rules
else
    rules
end

prices
while true
    set weather (calculateWeather "$weather")
    echo "========================="
    echo "It's day $day, the weather is $weather, you have $lemons lemons and $money money."
    echo "Tomorrow $planted_lemons lemons will be ready to harvest."

    while true
        read -P "How much lemon seeds do you want to buy? (2 money each) " seeds_to_buy
        or exit 1

        if string match -qr '^[0-9]+$' -- "$seeds_to_buy"
            set cost (math "$seeds_to_buy * 2")

            if test (math "$money - $cost") -ge 0
                set money (math "$money - $cost")
                set seeds (math "$seeds + $seeds_to_buy")
                echo "Bought $seeds_to_buy seeds for $cost money. Remaining money: $money"
                break
            else
                echo "Not enough money! You need $cost, but only have $money."
            end
        else
            echo "Invalid input! Please enter a whole number."
        end
    end

    while true
        read -P "How many lemons do you want to buy from the market? (5 money per seed) " lemons_to_buy
            or exit 1

        if string match -qr '^[0-9]+$' -- "$lemons_to_buy"
            set cost (math "$lemons_to_buy * 5")

            if test (math "$money - $cost") -ge 0
                set money (math "$money - $cost")
                set lemons (math "$lemons + $lemons_to_buy")
                echo "Bought $lemons_to_buy seeds for $cost money. You have $lemons now. Remaining money: $money"
                break
            else
                echo "Not enough money! You need $cost, but only have $money."
            end
        else
            echo "Invalid input! Please enter a whole number."
        end
    end

    while true
        read -P "How many lemons do you want to press into lemonade? (You got $lemons lemons) " lemons_to_press
            or exit 1

        if string match -qr '^[0-9]+$' -- "$lemons_to_press"
            set cost $lemons_to_press

            if test (math "$lemons - $cost") -ge 0
                set lemons (math "$lemons - $cost")
                set lemonade (math "$lemonade + $lemons_to_press")
                echo "Pressed $lemons_to_press to lemonade. You have $lemons now."
                break
            else
                echo "Not enough lemons! You need $lemons_to_press lemons, but you only have $lemons."
            end
        else
            echo "Invalid input! Please enter a whole number."
        end
    end

    set result (calculateCustomers $customers $customer_multiplier $day)
    set customers $result[1]
    set customer_multiplier $result[2]
    set day (math $day + 1)
    echo $customers
end