#!/bin/bash
set -e
export JGB_BUILD_DEBUG=1
rm arm64 x86_64 -rf
mkdir arm64 x86_64
for arch in arm64 x86_64;
do
	cd $arch
        for pkg in libpcap-1.10.5 tcpdump-4.99.5 traceroute-2.1.6 openssl-3.0.16 libwebsockets-v4.3.5 chrony-4.6.1 ;
	do
		jgb-src -R $pkg
		cd $pkg
		jgb-build -Ri -p $arch
		cd ..
	done
	cd ..
done
