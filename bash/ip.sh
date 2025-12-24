ip -brief addr show

ip -brief -4 addr show

ip -brief -6 addr show

ip -brief addr show dev eth0

ip -brief addr show up

ip -o -4 addr show | awk '{print $2,$4}'

ip -brief -o -4 addr show | grep -v lo | awk '{print $1,$3}'
