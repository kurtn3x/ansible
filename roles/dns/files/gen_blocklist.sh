#!/bin/sh

echo "server:" >/etc/unbound//unbound.conf.d/blacklist.conf
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | \
        grep ^0.0.0.0 - | \
        sed 's/ #.*$//;
        s/^0.0.0.0 \(.*\)/local-zone: "\1" refuse/' \
        >>/etc/unbound/unbound.conf.d/blacklist.conf
curl --output /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache
