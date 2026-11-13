#!/usr/bin/env fish

source (dirname (status filename))/lib/texts.fish

echo "Welcome to presssed"
echo "====================="
echo "A game to plant, harvest and press lemons into lemonade"

# Creating initial varriables
set day 0
set lemons 0
set money 100 # starting money
set lemonade 0

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
echo "========================="
