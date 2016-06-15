#!/bin/bash

## This file is part of Whonix.
## Copyright (C) 2012 - 2014 Patrick Schleizer <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

## {{{ controlportfilt.d

if [ -d /etc/controlportfilt.d ]; then
   for i in /etc/controlportfilt.d/* /rw/config/controlportfilt.d/*.conf; do
      if [ -f "$i" ]; then
         ## If the last character is a ~, ignore that file,
         ## because it was created by some editor,
         ## which creates backup files.
         if [ "${i: -1}" = "~" ]; then
            continue
         fi
         ## Skipping files such as .dpkg-old and .dpkg-dist.
         if ( echo "$i" | grep -q ".dpkg-" ); then
            true "skip $i"
            continue
         fi
         bash_n_exit_code="0"
         bash_n_output="$(bash -n "$i" 2>&1)" || { bash_n_exit_code="$?" ; true; };
         if [ ! "$bash_n_exit_code" = "0" ]; then
            echo "Invalid config file: $i
bash_n_exit_code: $bash_n_exit_code
bash_n_output:
$bash_n_output" >&2
         else
            source "$i"
         fi
      fi
   done
fi

## }}}

if [ ! "$CONTROL_PORT_FILTER_PROXY" = "0" ]; then

   export TOR_CONTROL_HOST="127.0.0.1"

   export TOR_CONTROL_PORT="9151"

   ## this is to satisfy Tor Button just filled up with anything
   export TOR_CONTROL_PASSWD='"password"'
fi
