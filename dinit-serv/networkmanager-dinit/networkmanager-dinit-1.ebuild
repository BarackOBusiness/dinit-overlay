# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for networkmanager"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/networkmanager-dinit"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

# networkmanager service depends on dbus
RDEPEND="
  net-misc/networkmanager
  dinit-serv/dbus-dinit
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/networkmanager"
}
