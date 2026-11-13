#!/usr/bin/env fish

source (status dirname)/../lib/customers.fish

set customers 0
set customer_multiplier 1
set day 1

set customers (calculateCustomers $customers $customer_multiplier $day)
echo $customers