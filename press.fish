#!/usr/bin/env fish

source (dirname (status filename))/lib/texts.fish
source (dirname (status filename))/lib/weather.fish

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
    echo "Invalid input. Please enter 'y' or 'n'."
end

prices
set weather (calculateWeather "$weather")
echo "========================="
echo "It's day $day, the weather is $weather, you have $lemons lemons and $money money."
echo "Tomorrow $planted_lemons lemons will be ready to harvest."

while true
    read -P "How much lemon seeds do you want to buy? (2 money each) " seeds_to_buy
    or exit 1

    if string match -qr '^[0-9]+$' -- "$seeds_to_buy"
        set cost (math "$seeds_to_buy * 5")

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
read -P "How many lemons do you want to buy from the market? (5 lemon per seed) " lemons_to_bzy
read -P "How many lemons do you want to press into lemonade? (You got $lemons lemons) " lemons_to_press