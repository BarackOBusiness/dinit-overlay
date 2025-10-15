#!/bin/sh

_nftables() {
  /usr/libexec/nftables/nftables.sh "${@}"
}

if [ "$1" = "start" ]; then
  # Load the ruleset if it exists, if there's no ruleset, just exit 0
  _nftables check "${NFTABLES_SAVE}" && _nftables load "${NFTABLES_SAVE}" || exit 0
else
  # Respect the user's choice of handling stopping nftables
  if [ "${PANIC_ON_STOP}" = "hard" ]; then
    _nftables panic
  elif [ "${PANIC_ON_STOP}" = "soft" ]; then
    _nftables panic_soft
  else
    _nftables clear
  fi
fi
