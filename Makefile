.PHONY: build configure prepare clean

build: configure
	docker run --rm -t --privileged -v $(PWD)/vyos-build:/vyos -w /vyos vyos/vyos-build:current sudo make iso
	mkdir -p ./build
	mv vyos-build/build/vyos-*.iso ./build

configure: prepare
	docker run --rm -t --privileged -v $(PWD)/vyos-build:/vyos -w /vyos vyos/vyos-build:current ./configure --architecture amd64 --build-comment "VyOS with Netclient" --build-type production --version 1.4-rolling-`date +%Y%m%d%H%M`

prepare:

#	mkdir -p vyos-build/data/live-build-config/includes.chroot/etc/netclient
	mkdir -p vyos-build/data/live-build-config/includes.chroot/usr/sbin
	cp netmaker/netclient vyos-build/data/live-build-config/includes.chroot/usr/sbin/netclient
	mkdir -p vyos-build/data/live-build-config/includes.chroot/etc/systemd/system/netclient.service.d
	cp netmaker/override.conf vyos-build/data/live-build-config/includes.chroot/etc/systemd/system/netclient.service.d/override.conf

clean:
	rm -rf ./build
