#!/bin/bash
# Adjust /etc/$ImageMagic/policy.xml if policy errors occur
echo "[*] Starting Nmap, Screenshot Script"
for ip in $(cat ip_list);
do
		ip_filename=$(echo $ip | tr '.' '_')
        echo "-- $ip --"
        echo "[*] Executing Nmap and Screenshots for $ip"
        nmap -Pn -sV -A -oN "${ip}_nmap_output.nmap" $ip\
        | convert -fill white -background black -font Liberation-Mono \
        -size 480x -trim -border 4 -bordercolor black \
        caption:@- "${ip_filename}_nmap_sV_A_screen.PNG"
        echo "[*] Finished $ip"
done
echo "[*] Script Finished"
