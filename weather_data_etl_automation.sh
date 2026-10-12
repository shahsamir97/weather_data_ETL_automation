#! /bin/bash
 
city=Berlin
curl -s wttr.in/$city?T --output weather_report

obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"

TZ='Europe/Berlin'

day=$(TZ='Europe/Berlin' date -u +%d)
month=$(TZ='Europe/Berlin' date +%m)
year=$(TZ='Europe/Berlin' date +%Y)

record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp C")
echo "$record">>weather_report.log
