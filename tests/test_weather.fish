#!/usr/bin/env fish

source (status dirname)/../lib/weather.fish

set weather ""

set weather (calculateWeather "$weather")
echo $weather