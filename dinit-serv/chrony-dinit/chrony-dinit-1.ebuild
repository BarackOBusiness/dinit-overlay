# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for chrony"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/chrony-dinit"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  net-misc/chrony
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/chrony"
  doins "${FILESDIR}/chronyd"
}
