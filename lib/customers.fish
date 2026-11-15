function calculateCustomers --argument-names customers customer_multiplier day
    set -l customersRaw (random 1 10)
    set customers (math "$customersRaw * $customer_multiplier")
    set customer_multiplier (math "$customer_multiplier * 1.06")
    echo $customers
    echo $customer_multiplier
end