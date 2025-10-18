#!/bin/bash
set -e
export JGB_BUILD_DEBUG=1
rm arm64 x86_64 -rf
mkdir arm64 x86_64
for arch in arm64 x86_64;
do
    for type_ in Debug Release;
      do
	cd $arch
        for pkg in openssl-3.0.16 libpcap-1.10.5 tcpdump-4.99.5 traceroute-2.1.6 libwebsockets-4.3.5 chrony-4.6.1 ;
	do
		jgb-src -R $pkg
		cd $pkg
		jgb-build -RiL -p $arch -t$type_
		cd ..
	done
	cd ..
      done
done
echo 完成
