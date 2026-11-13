#!/usr/bin/env fish

source (dirname (status filename))/lib/texts.fish
source (dirname (status filename))/lib/weather.fish

echo "Welcome to presssed"
echo "====================="
echo "A game to plant, harvest and press lemons into lemonade"

# Creating initial varriables
set day 0
set lemons 0
set planted_lemons 0
set customers 0
set customer_multiplier 1
set money 100 # starting money
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
set weather = calculateWeather $weather
echo "========================="
echo "It's day $day, the weather is $weather, you have $lemons lemons and $money money."
echo "Tomorrow $planted_lemons lemons will be ready to harvest."

read -P "How much lemon seeds do you want to buy? (5 money each) " seeds_to_buy
read -P "How many lemons do you want to plant? (2 lemon per seed) " lemons_to_plant
read -P "How many lemons do you want to press into lemonade? (You got $lemons lemons) " lemons_to_press

