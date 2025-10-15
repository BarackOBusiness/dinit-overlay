# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for the mumble server murmur"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  net-voip/murmur
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/murmur"
}
