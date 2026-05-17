#!/bin/bash 

time="$(date "+%I:%M %p")"
echo "󰥔 $time "


# hour=$(date +%H)
#
# if [ "$hour" -ge 0 ] && [ "$hour" -lt 5 ]; then
#     color="#6c7086"; icon="🌙"
# elif [ "$hour" -ge 5 ] && [ "$hour" -lt 8 ]; then
#     color="#f2cdcd"; icon="🌅"
# elif [ "$hour" -ge 8 ] && [ "$hour" -lt 12 ]; then
#     color="#f9e2af"; icon="☀️"
# elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
#     color="#cdd6f4"; icon=""
# elif [ "$hour" -ge 17 ] && [ "$hour" -lt 21 ]; then
#     color="#cba6f7"; icon="🌆"
# else
#     color="#89b4fa"; icon="🌃"
# fi
#
# printf "^c$color^$icon $(date '+%I:%M %p')^d^"
