# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for elogind"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/elogind-dinit"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-auth/elogind
  dinit-serv/dbus-dinit
  # Also needs polkit if elogind has polkit USE enabled
  # not sure how to go about that for now
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/elogind"
}
