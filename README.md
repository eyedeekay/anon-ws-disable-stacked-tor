# Prevents Tor over Tor in Anonymity Distribution Workstations #

Supposed to be installed on Workstations, which prevents installing the real
Tor package from upstream (ex: Debian, The Tor Project) APT repositories. Its
purpose is to prevent, running Tor over Tor.

It allows installation of packages, which depend on Tor, such as TorChat,
parcimonie and torbrowser-launcher.

This package uses the "Provides: tor" field[1], which should avoid any kinds of
conflicts, in case upstream releases a higher version of Tor. This won't work
for packages, which depend on an explicit version of Tor (such as TorChat).
This is non-ideal, since for example the torchat package will install Tor, but
still acceptable, because of the following additional implementations.

Tor's autostart is disabled in /etc/default/tor (dpkg-diverted using
config-package-dev), so even if the tor package gets installed, it won't be
automatically started.

Binaries eventually installed (by the tor Debian package) /usr/bin/tor as well
as /usr/sbin/tor are replaced with a dummy wrapper that does nothing
(dpkg-diverted using config-package-dev).

socat listens on Tor's default ports. system Tor's 127.0.0.1:9050,
127.0.0.1:9051 and TBB's 127.0.0.1:9150, 127.0.0.1:9051, which prevents the
default Tor Browser Bundle or Tor package by The Tor Project from opening
these default ports, which will result in Tor failing to open its listening
port and therefore exiting, thus preventing Tor over Tor.

See also:
https://tor.stackexchange.com/questions/427/is-running-tor-over-tor-dangerous

[1] See "7.5 Virtual packages - Provides" on
http://www.debian.org/doc/debian-policy/ch-relationships.html

This package is produced independently of, and carries no guarantee from,
The Tor Project.
## How to install `anon-ws-disable-stacked-tor` using apt-get ##

1\. Add [Whonix's Signing Key](https://www.whonix.org/wiki/Whonix_Signing_Key).

```
sudo apt-key --keyring /etc/apt/trusted.gpg.d/whonix.gpg adv --keyserver hkp://ipv4.pool.sks-keyservers.net:80 --recv-keys 916B8D99C38EAF5E8ADC7A2A8D66066A2EEACCDA
```

3\. Add Whonix's APT repository.

```
echo "deb http://deb.whonix.org stretch main" | sudo tee /etc/apt/sources.list.d/whonix.list
```

4\. Update your package lists.

```
sudo apt-get update
```

5\. Install `anon-ws-disable-stacked-tor`.

```
sudo apt-get install anon-ws-disable-stacked-tor
```

## How to Build deb Package ##

Replace `apparmor-profile-torbrowser` with the actual name of this package with `anon-ws-disable-stacked-tor` and see [instructions](https://www.whonix.org/wiki/Dev/Build_Documentation/apparmor-profile-torbrowser).

## Contact ##

* [Free Forum Support](https://forums.whonix.org)
* [Professional Support](https://www.whonix.org/wiki/Professional_Support)

## Payments ##

`anon-ws-disable-stacked-tor` requires [payments](https://www.whonix.org/wiki/Payments) to stay alive!
