#!/bin/bash

file=$1

if [ -z "$file" ] || [ ! -f "$file" ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

echo "====================================="
echo "Top 5 IP addresses with the most requests"
echo "====================================="

top_5=$(awk '{print $1}' "$file" | sort | uniq -c | sort -nr | head -5)

count=1
while [ $count -le 5 ]; do
    line=$(echo "$top_5" | awk -v n="$count" 'NR==n')
    req=$(echo "$line" | awk '{print $1}')
    ip=$(echo "$line" | awk '{print $2}')
    echo "$ip - $req requests"
    ((count++))
done

echo ""
echo "====================================="
echo "Top 5 most requested paths"
echo "====================================="

awk '{print $7}' "$file" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "====================================="
echo "Top 5 response status codes"
echo "====================================="

awk '{print $9}' "$file" | grep -E '^[2-5][0-9][0-9]$' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " times"}'

echo ""
echo "====================================="
echo "Top 5 user agents"
echo "====================================="

awk -F\" '{print $6}' "$file" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " times"}'
