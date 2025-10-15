# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for nftables"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  net-firewall/nftables
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/nftables"
  exeinto /usr/libexec/nftables
  doexe "${FILESDIR}/helper.sh"
}

pkg_postinst() {
  echo ""
  elog "This service does not exhibit feature parity with the corresponding"
  elog "OpenRC init script, it does however inherit some of it's configuration."
  elog "Set the value of the variable NFTABLES_SAVE to the path of an nftables"
  elog "ruleset you wish to be loaded."
  elog "Additionally the PANIC_ON_STOP variable is respected."
  echo ""
}
