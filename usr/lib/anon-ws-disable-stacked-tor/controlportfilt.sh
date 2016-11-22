#!/bin/sh

## This file is part of Whonix.
## Copyright (C) 2012 - 2014 Patrick Schleizer <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

## This file gets `source`ed by /etc/X11/Xsession.d by `sh`, not `bash`.

for i in /etc/controlportfilt.d/*.conf /rw/config/controlportfilt.d/*.conf; do
   if [ -f "$i" ]; then
      . "$i"
   fi
done

if [ ! "$CONTROL_PORT_FILTER_PROXY" = "0" ]; then

   export TOR_CONTROL_HOST="127.0.0.1"

   export TOR_CONTROL_PORT="9151"

   ## this is to satisfy Tor Button just filled up with anything
   export TOR_CONTROL_PASSWD='"password"'
fi
