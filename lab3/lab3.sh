#!/bin/bash

#ACCESS_LOG

echo "10 IP addresses"
cat access_log | grep -o "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | sort -u | head -10

echo "Queries that includes 'denied' in link"
cat access_log | grep "/denied" 

echo "Queries from given IP"
cat access_log | grep "^64\.242\.88\.10 "

echo "DELETE type queries"
cat access_log | grep "DELETE" | sort -u

#YOLO.CSV

echo "Users with uneven ID"
cat yolo.csv | cut -f 1,2,3 -d "," | grep "^[0-9]*[13579]," >&2 #tu jeszcze nie dziala

echo "Users worth given numbers"
cat yolo.csv | grep "\$[259]\.99[MB]$" | cut -f 2,3 -d ","

#GROOVIES

echo "Replace $HEADERS$ with /temat/"
sed -i 's/\$HEADER\$/\/temat\//g' groovies/*.groovy

echo "Delete lines that includes 'Help docs:'"
sed -i '/Help docs:/d'  groovies/*.groovy
