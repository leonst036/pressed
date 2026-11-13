function calculateCustomers --argument-names customers customer_multiplier day
    set -l customersRaw (random 1 10)
    set customers (math "$customersRaw * $customer_multiplier")
    set customer_multiplier (math "$customer_multiplier + $day / 0.3")
end