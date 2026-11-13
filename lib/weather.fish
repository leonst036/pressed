function calculateWeather --argument-names past_weather
    # probabilities: 1. sunny, 2. cloudy, 3. rainy, 4. stormy, 5. snowy
set -l weather_probabilities
    if test "$past_weather" = "sunny"
        set weather_probabilities 0.6     0.25    0.1     0.04    0.01
    else if test "$past_weather" = "cloudy"
        set weather_probabilities 0.8     0.1     0.05    0.04    0.01
    else if test "$past_weather" = "rainy"
        set weather_probabilities 0.75    0.15    0.06    0.03    0.01
    else if test "$past_weather" = "stormy"
        set weather_probabilities 0.6     0.2     0.12    0.06    0.02
    else if test "$past_weather" = "snowy"
        set weather_probabilities 0.95    0.02    0.015   0.01    0.005
    else
        set weather_probabilities 0.5     0.3     0.15    0.04    0.01
    end
    set -l random_number (random 1 100)
    set -l weather
    if test $random_number -le (math "$weather_probabilities[1] * 100")
        set weather "sunny"
    else if test $random_number -le (math "($weather_probabilities[1] + $weather_probabilities[2]) * 100")
        set weather "cloudy"
    else if test $random_number -le (math "($weather_probabilities[1] + $weather_probabilities[2] + $weather_probabilities[3]) * 100")
        set weather "rainy"
    else if test $random_number -le (math "($weather_probabilities[1] + $weather_probabilities[2] + $weather_probabilities[3] + $weather_probabilities[4]) * 100")
        set weather "stormy"
    else
        set weather "snowy"
    end
    echo $weather
end