#!/bin/bash

## This file is part of Whonix.
## Copyright (C) 2012 - 2014 Patrick Schleizer <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

## Deactivate tor-launcher,
## a Vidalia replacement as browser extension,
## to prevent running Tor over Tor.
## https://trac.torproject.org/projects/tor/ticket/6009
## https://gitweb.torproject.org/tor-launcher.git
export TOR_SKIP_LAUNCH=1

## The following TOR_SOCKS_HOST and TOR_SOCKS_PORT variables
## do not work flawlessly, due to an upstream bug in Tor Button:
##    "TOR_SOCKS_HOST, TOR_SOCKS_PORT regression"
##    https://trac.torproject.org/projects/tor/ticket/8336
## (As an alternative,
##    /home/user/tor-browser_en-US/Data/profile/user.js
## could be used.)
## Fortunately, this is not required for Whonix by default anymore,
## because since Whonix 0.6.2, rinetd is configured to redirect
## Whonix-Workstation ports
##   127.0.0.1:9050 to Whonix-Gateway 10.152.152.10:9050 and
##   127.0.0.1:9150 to Whonix-Gateway 10.152.152.10:9150.
#export TOR_SOCKS_HOST="10.152.152.10"
#export TOR_SOCKS_PORT="9100"

#export TOR_TRANSPROXY=1

## environment variable to skip TorButton control port verification
## https://trac.torproject.org/projects/tor/ticket/13079
export TOR_SKIP_CONTROLPORTTEST=1
