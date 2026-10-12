#!/bin/bash

input_file="weather_report.log"
output_file="historical_fc_accuracy.tsv"

echo -e "year\tmonth\tday\tobs_temp\tfc_temp\taccuracy\taccuracy_range" > "$output_file"

total_lines=$(wc -l < "$input_file")

for ((i=3; i<=total_lines; i++))
do
    yesterday=$(head -n "$((i-1))" "$input_file" | tail -1)
    today=$(head -n "$i" "$input_file" | tail -1)
    yesterday_fc=$(echo "$yesterday" | cut -f5 | grep -Eo '^-?[0-9]+')

    today_temp=$(echo "$today" | cut -f4 | grep -Eo '^-?[0-9]+')

    year=$(echo "$today" | cut -f1)
    month=$(echo "$today" | cut -f2)
    day=$(echo "$today" | cut -f3)

    accuracy=$((yesterday_fc - today_temp))

    if [ "$accuracy" -lt 0 ]; then
        accuracy=$((accuracy * -1))
    fi

    if [ "$accuracy" -le 1 ]; then
        accuracy_range="excellent"
    elif [ "$accuracy" -le 2 ]; then
        accuracy_range="good"
    elif [ "$accuracy" -le 3 ]; then
        accuracy_range="fair"
    else
        accuracy_range="poor"
    fi

    echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range" >> "$output_file"
done

echo "Historical forecast accuracy report generated."