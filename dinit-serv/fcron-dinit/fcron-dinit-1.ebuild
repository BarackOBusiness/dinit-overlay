# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for fcron"
HOMEPAGE="https://gitea.artixlinux.org/packages/fcron-dinit/src/branch/master/fcron"
# Don't even know what this should be for artix, it's not in a repo that has a license
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-process/fcron
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/fcron"
}
