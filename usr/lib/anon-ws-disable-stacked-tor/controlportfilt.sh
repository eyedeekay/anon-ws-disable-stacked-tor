#!/bin/bash

## This file is part of Whonix.
## Copyright (C) 2012 - 2014 Patrick Schleizer <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

## {{{ controlportfilt.d

shopt -s nullglob
for i in /etc/controlportfilt.d/*.conf /rw/config/controlportfilt.d/*.conf; do
   bash_n_exit_code="0"
   bash_n_output="$(bash -n "$i" 2>&1)" || { bash_n_exit_code="$?" ; true; };
   if [ ! "$bash_n_exit_code" = "0" ]; then
      echo "Invalid config file: $i
bash_n_exit_code: $bash_n_exit_code
bash_n_output:
$bash_n_output" >&2
      exit 1
   fi
   source "$i"
done

## }}}

if [ ! "$CONTROL_PORT_FILTER_PROXY" = "0" ]; then

   export TOR_CONTROL_HOST="127.0.0.1"

   export TOR_CONTROL_PORT="9151"

   ## this is to satisfy Tor Button just filled up with anything
   export TOR_CONTROL_PASSWD='"password"'
fi
