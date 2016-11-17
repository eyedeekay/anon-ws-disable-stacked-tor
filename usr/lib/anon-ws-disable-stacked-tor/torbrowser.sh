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
## because since Whonix 0.6.2, socat is configured to redirect
## Whonix-Workstation ports
##   127.0.0.1:9050 to Whonix-Gateway 10.152.152.10:9050 and
##   127.0.0.1:9150 to Whonix-Gateway 10.152.152.10:9150.
#export TOR_SOCKS_HOST="10.152.152.10"
#export TOR_SOCKS_PORT="9150"

#export TOR_TRANSPROXY=1

## Environment variable to configure Tor Browser to use a pre existing unix
## domain socket file instead of creating its own one to avoid Tor over Tor and
## to keep it being able to connect.
## Since Whonix 12, socat is creating a unix domain socket file
## /var/run/anon-ws-disable-stacked-tor/127.0.0.1_9150.sock which forwards to
## 127.0.0.1:9150, where socat is listening, which forwards it to the gateway
## port 9150.
## https://phabricator.whonix.org/T192
## https://trac.torproject.org/projects/tor/ticket/20111#comment:5
export TOR_SOCKS_IPC_PATH="/var/run/anon-ws-disable-stacked-tor/127.0.0.1_9150.sock"
export TOR_CONTROL_IPC_PATH="/var/run/anon-ws-disable-stacked-tor/127.0.0.1_9151.sock"

## environment variable to skip TorButton control port verification
## https://trac.torproject.org/projects/tor/ticket/13079
export TOR_SKIP_CONTROLPORTTEST=1

## Environment variable to disable the "TorButton" ->
## "Open Network Settings..." menu item. It is not useful and confusing to have
## on a workstation, because Tor must be configured on the gateway, which is
## for security reasons forbidden from the gateway.
## https://trac.torproject.org/projects/tor/ticket/14100
export TOR_NO_DISPLAY_NETWORK_SETTINGS=1
