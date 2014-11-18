#!/bin/bash

HAPROXY="/etc/haproxy"
CUSTOM_CONFIG="/custom"
PIDFILE="/var/run/haproxy.pid"

CONFIG="haproxy.cfg"
SSLCERT="ssl.pem"
ERRORS="errors"

cd "$HAPROXY"

# Symlink errors directory
if [[ -d "$CUSTOM_CONFIG/$ERRORS" ]]; then
  mkdir -p "$CUSTOM_CONFIG/$ERRORS"
  rm -fr "$ERRORS"
  ln -s "$CUSTOM_CONFIG/$ERRORS" "$ERRORS"
fi

# Symlink config file.
if [[ -f "$CUSTOM_CONFIG/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$CUSTOM_CONFIG/$CONFIG" "$CONFIG"
fi

# Symlink config file.
if [[ -f "$CUSTOM_CONFIG/$SSLCERT" ]]; then
  rm -f "$SSLCERT"
  ln -s "$CUSTOM_CONFIG/$SSLCERT" "$SSLCERT"
fi

haproxy -f "$CONFIG" -p "$PIDFILE"