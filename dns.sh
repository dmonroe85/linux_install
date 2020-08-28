[200~#!/bin/bash
set -e

# Raspberry Pi dnsmasq script
# Stephen Wood
# www.heystephenwood.com
# 
# Usage: $ sudo ./raspberrypi_dnsmasq
#
# Net install:
#   $ curl https://raw.github.com/stephendotexe/raspberrypi/master/roles/dnsmasq_server | sudo sh

# Must be run as root
if [[ `whoami` != "root" ]]
then
	echo "This install must be run as root or with sudo."
	exit
fi

apt-get install -y dnsmasq dnsutils

# Set Up Main Conf
cat - > /etc/dnsmasq.conf <<DNSMASQCONF
# Set up your local domain here
domain-needed
bogus-priv
expand-hosts
domain=bu.net
local=/bu.net/
resolv-file=/etc/resolv.dnsmasq

# Public DNS Servers
server=8.8.8.8
server=8.8.4.4

# Max cache size dnsmasq can give us, and we want all of it!    
cache-size=10000    

DNSMASQCONF

# Set Up Resolver Conf
cat - > /etc/resolv.dnsmasq <<RESOLVERCONF
nameserver 127.0.0.1

RESOLVERCONF

service dnsmasq restart

echo "Testing dns performance with random urls"

# We'll generate a list of urls that we're moderately certain doesn't exist in our cache to get a good base line for speed increases.
URLS=`for i in {1..50}; do echo www.$RANDOM.com;done`

# Make the requests in parallel
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms"}'
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms"}'
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms"}'
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms"}'

echo 'Installation complete. Enjoy!'
