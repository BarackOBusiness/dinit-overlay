# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for polkit"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/polkit-dinit"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-auth/polkit
  dinit-serv/dbus-dinit
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/polkitd"
}

pkg_postinst() {
  ewarn "You must install the polkit package provided from this overlay for"
  ewarn "this service to function. polkitd does not handle readiness with"
  ewarn "dinit and failure to install the overlay variant will result in a non"
  ewarn "booting system should your boot sequence depend on polkitd."
}
