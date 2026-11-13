function calculateWeather --argument-names past_weather
    if past_weather = "sunny"
        set -l weather_probabilities 0.6    0.25     0.1     0.04    0.01
    else if past_weather = "cloudy"
        set -l weather_probabilities 0.4    0.35     0.15   0.08    0.02
    else if past_weather = "rainy"
        set -l weather_probabilities 0.3    0.4     0.2     0.08    0.02
    else if past_weather = "stormy"
        set -l weather_probabilities 0.2    0.3     0.3     0.15    0.05
    else if past_weather = "snowy"
        set -l weather_probabilities 0.1    0.2     0.3     0.25    0.15
    else if past_weather = ""
        set -l weather_probabilities 0.5    0.3     0.15     0.05    0.01
    end
    set -l random_number (math random 1 100) / 100
    if test $random_number -lt $weather_probabilities[0]
        set -l weather "sunny"
    else if test $random_number -lt $weather_proabilities[1]
        set -l weather "cloudy"
    else if test $random_number -lt $weather_probabilities[2]
        set -l weather "rainy"
    else if test $random_number -lt $weather_probabilities[3]
        set -l weather "stormy"
    else if test $random_number -lt $weather_probabilities[4]
        set -l weather "snowy"
    end
end