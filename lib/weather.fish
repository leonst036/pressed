function calculateWeather() --argument-names past_weather
    set -l weather_conditions "sunny" "cloudy" "rainy" "stormy" "snowy"
    set -l weather_probabilities 0.5    0.3     0.15     0.05    0.01
    set -l random_number (math random 1 100) / 100
    if test $random_number -lt 0.5
        set -l weather "sunny"
    else if test $random_number -lt 0.8
        set -l weather "cloudy"
    else if test $random_number -lt 0.95
        set -l weather "rainy"
    else if test $random_number -lt 0.99
        set -l weather "stormy"
    else
        set -l weather "snowy"
    end
end