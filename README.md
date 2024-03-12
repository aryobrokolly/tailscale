# Tailscale on OpenWRT

Download this:
```
bash -c "$(wget -qO - 'https://raw.githubusercontent.com/aryobrokolly/tailscale/master/install.sh')"
```

1. Install the prerequisites for wget and tailscale:
```
opkg update && opkg install libustream-openssl ca-bundle kmod-tun
```

2. Run tailscale for the first time:
```
/etc/init.d/tailscale start
```

Both of these commands download the tailscale package to get the binaries to /tmp.
The /etc/init.d/tailscale will start the tailscale daemon. 
The next command uses the tailscale CLI to configure the login and add some settings to prevent dns changes and advertise routes. Use the URL printed to login to tailscale.

3. Enable tailscale at boot:
```
/etc/init.d/tailscale enable
```

Verify by looking for an entry here:
```
ls /etc/rc.d/S*tailscale*
```

4. Reboot the router and verify that it shows up online on the [Tailscale Admin portal](https://login.tailscale.com/admin/machines).

5. To update the version of tailscale, grab the latest version [here](https://pkgs.tailscale.com/stable/#static) of the form `1.2.10_mips` and replace the same in `/usr/bin/tailscale` and `/usr/bin/tailscaled`: `version="1.2.10_mips"`.

6. Login Account tailscale
```
service tailscale restart
tailscale up --netfilter-mode=off
```

Note: You need to have atleast 11+16 = ~27 MB of free space in `/tmp` (which is usually in RAM) to be able to use this.

# Donate

<img src="https://github.com/aryobrokolly/XRAY-MPORT/blob/26495331210caf0380909a4478a7b3721e04124c/img/qris.jpg" alt="DONASI" width="350" height="470">
