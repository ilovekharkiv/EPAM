

## [Part B. Using Apache log example create a script to answer the following questions](https://github.com/ilovekharkiv/EPAM-L1/blob/master/Homework%20%231.%20Linux%20Bash.md#part-2) 
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP


```bash
#!/bin/bash

file=$1

#1. Which ip were the most requests from?

most_requests_ip () {
echo Which ip were the most requests from?
awk '{print $1}' $file | sort | uniq -c | sort -nr | head -1
}
most_requests_ip

#2. What is the most requested page?

most_requests_url () {
echo What is the most requested page?
awk '{print $11}' $file | sort | uniq -c | sort -nr | grep http | head -1
}
most_requests_url

#3. How many requests were there from each ip?

most_requests_from_ip () {
echo How many requests were there from each ip?
awk '/google.ru/ {print $1}' $file | sort | uniq -c | sort -nr
echo
}
most_requests_from_ip

#4. What non-existent pages were clients referred to?

non_existent () {
echo What non-existent pages were clients referred to?
awk '{ if($9 == 404) {print $11} }' $file | sort | uniq | sort -nr
}
non_existent

#5. What time did site get the most requests?

most_requests_time () {
echo What time did site get the most requests?
awk '{print $4,$5}' $file | sort | uniq -c | sort -nr | head -1
}
most_requests_time

#6. What search bots have accessed the site? (UA + IP)

search_bots () {
echo What search bots have accessed the site? UA + IP
cut -f 1,14,15 -d ' ' $file | grep bot | sort -nr | uniq
}
search_bots
```
>Quick note related to #6. I didn't find a single UA-bot in the log file, so that i kept it as it is.
```bash
Which ip were the most requests from?
  29 94.78.95.154
What is the most requested page?
  59 "https://www.google.ru/"
How many requests were there from each ip?
   3 66.102.9.32
   3 31.173.84.130
   2 93.90.82.222
   2 83.220.239.112
   2 62.192.231.56
   2 2.61.172.119
   2 193.109.165.82
   2 176.101.120.30
   1 94.50.193.4
   1 94.253.16.43
   1 93.81.227.242
   1 93.171.225.250
   1 91.185.224.252
   1 89.151.191.81
   1 89.110.58.38
   1 88.200.136.82
   1 87.255.2.250
   1 85.30.209.153
   1 85.26.232.7
   1 85.140.0.112
   1 85.12.216.247
   1 83.149.45.161
   1 81.200.244.154
   1 81.20.197.5
   1 80.83.224.37
   1 79.142.89.90
   1 66.102.9.38
   1 66.102.9.35
   1 62.192.249.56
   1 62.182.200.117
   1 62.182.200.107
   1 5.165.7.51
   1 5.164.154.6
   1 46.48.210.106
   1 46.39.53.115
   1 46.173.188.61
   1 46.146.221.213
   1 31.173.100.163
   1 217.66.152.29
   1 217.118.83.192
   1 217.118.79.33
   1 213.87.160.85
   1 213.87.147.182
   1 213.87.146.205
   1 213.87.128.54
   1 213.87.121.216
   1 213.24.132.205
   1 212.232.8.174
   1 194.186.174.171
   1 188.170.200.96
   1 188.120.50.214
   1 178.120.82.80
   1 176.59.48.210
   1 176.59.42.84
   1 109.252.2.191

What non-existent pages were clients referred to?
"http://example.com/ukhod-za-soboj/pokhudenie/dieti/skandinavskaya-dieta-dlya-pokhudeniya.html"
"http://example.com/ukhod-za-soboj/pokhudenie/dieti/menyu-razdelnogo-pitaniya-dlya-pokhuden.html"
"http://example.com/ukhod-za-soboj/pokhudenie/dieti/dieta-maggi-tvorozhnyjj-variant.html"
"http://example.com/ukhod-za-soboj/pokhudenie/dieti/dieta-grechnevaya-s-kefirom.html"
"http://example.com/ukhod-za-soboj/molodost/omolozhenie-lica-posle-50-let.html"
"http://example.com/ukhod-za-soboj/bolezni-kozhi/sukhaya-mozol-na-palce-nogi.html"
"http://example.com/ehsteticheskaya-medicina/injekcii/oblasti-lica-dlya-primeneniya-kozhnykh-fi.html"
"http://example.com/ehsteticheskaya-medicina/injekcii/biorevitalizaciya/preparaty-dlya-biorevitalizacii.html"
"-"
What time did site get the most requests?
   4 [25/Apr/2017:11:40:56 +0400]
What search bots have accessed the site? UA + IP 
217.182.132.183 AhrefsBot/5.2; +http://ahrefs.com/robot/)"
207.46.13.3 bingbot/2.0; +http://www.bing.com/bingbot.htm)"
207.46.13.128 bingbot/2.0; +http://www.bing.com/bingbot.htm)"
207.46.13.109 bingbot/2.0; +http://www.bing.com/bingbot.htm)"
164.132.161.85 AhrefsBot/5.2; +http://ahrefs.com/robot/)"
164.132.161.63 AhrefsBot/5.2; +http://ahrefs.com/robot/)"
164.132.161.40 AhrefsBot/5.2; +http://ahrefs.com/robot/)"
144.76.76.115 MJ12bot/v1.4.7; http://mj12bot.com/)"
136.243.34.71 bingbot/2.0; +http://www.bing.com/bingbot.htm)"
66.249.66.204 Googlebot/2.1; +http://www.google.com/bot.html)"
66.249.66.199 Googlebot/2.1; +http://www.google.com/bot.html)"
66.249.66.194 Googlebot/2.1; +http://www.google.com/bot.html)"
40.77.167.19 bingbot/2.0; +http://www.bing.com/bingbot.htm)"
5.255.251.28 YandexBot/3.0; +http://yandex.com/bots)"

```
