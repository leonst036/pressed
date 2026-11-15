#!/usr/bin/env fish

source (status dirname)/../lib/customers.fish

# needed varriables for the function
set customers 0
set customer_multiplier 1
set day 1

set loops 50
set runned_loops 0

while test $runned_loops -lt $loops
    set result (calculateCustomers $customers $customer_multiplier $day)
    set customers $result[1]
    set customer_multiplier $result[2]
    echo $customers
    echo "Multiplier:" $customer_multiplier
    set runned_loops (math $runned_loops + 1)
end