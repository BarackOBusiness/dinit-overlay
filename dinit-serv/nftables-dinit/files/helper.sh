#!/bin/sh

NFTABLES_SAVE="${2:-'/etc/nftables.conf'}"

_nftables() {
  /usr/libexec/nftables/nftables.sh "${@}"
}

if [ "$1" = "start" ]; then
  # Load the ruleset if it exists, if there's no ruleset, just exit 0
  _nftables check "${NFTABLES_SAVE}" && _nftables load "${NFTABLES_SAVE}" || exit 0
else
  # Here I would normally handle PANIC_ON_STOP value, but the panic and panic_soft
  # functions in nftables.sh don't seem to do anything at all?
  _nftables clear
fi
