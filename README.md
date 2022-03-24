# vyos-netmaker
Custom VyOS 1.4.x build that includes the netclient daemon

Building requires a Linux machine, and Docker. The resulting `.iso` will be created in the `build` directory.

This was inspired by and forked from [vyos-tailscale](https://github.com/DMarby/vyos-tailscale.git)

## Usage:
```bash
git clone --recursive https://github.com/kylechase/vyos-netmaker.git
cd vyos-netmaker
make
```
