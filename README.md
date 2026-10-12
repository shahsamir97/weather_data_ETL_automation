# Weather Data ETL & Forecast Accuracy Analysis

## Project Overview
A Bash-based ETL pipeline that retrieves weather data, records daily temperatures, evaluates forecast accuracy, and analyzes historical forecasting errors using Linux command-line tools.

## Problem
Manually collecting weather data and comparing forecasts with actual temperatures is repetitive and makes historical accuracy analysis difficult.

## Solution
Implemented three Bash scripts to automate the workflow:

- **`weather_data_etl_automation.sh`** — Fetches Berlin weather data from `wttr.in` using `curl`, extracts observed and next-day forecast temperatures, and appends records to a log file.
- **`fc_accuracy.sh`** — Processes consecutive weather records, compares the previous day's forecast with the current day's observed temperature, calculates absolute errors, and generates a TSV accuracy report.
- **`weekly_stats.sh`** — Processes the latest seven records from a synthetic historical dataset and calculates minimum and maximum absolute forecast errors.

## Tech Stack
Bash, Linux, cURL, grep, sed, cut, head, tail, TSV

## Outcome
Built a command-line ETL workflow that transforms raw weather data into structured records and generates historical forecast error reports and weekly error statistics.
