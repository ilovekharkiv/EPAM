```bash
#!/bin/bash

file=$1

## 1. Which ip were the most requests from?

most_requests_ip () {
echo Which ip were the most requests from?
awk '{print $1}' $file | sort | uniq -c | sort -nr | head -1
}
most_requests_ip

## 2. What is the most requested page?

most_requests_url () {
echo What is the most requested page?
awk '{print $11}' $file | sort | uniq -c | sort -nr | grep http | head -1
}
most_requests_url

### 3. How many requests were there from each ip?

most_requests_from_ip () {
echo How many requests were there from each ip?
awk '/google.ru/ {print $1}' $file | sort | uniq -c | sort -nr
echo
}
most_requests_from_ip

## 4. What non-existent pages were clients referred to?
non_existent () {
echo What non-existent pages were clients referred to?
awk '{ if($9 == 404) {print $11} }' $file | sort | uniq | sort -nr
}
non_existent

## 5. What time did site get the most requests?

most_requests_time () {
echo What time did site get the most requests?
awk '{print $4,$5}' $file | sort | uniq -c | sort -nr | head -1
}
most_requests_time

## 6. What search bots have accessed the site? (UA + IP)

search_bots () {
echo What search bots have accessed the site? UA + IP
cut -f 1,14,15 -d ' ' $file | grep bot | sort -nr | uniq
}
search_bots
```
