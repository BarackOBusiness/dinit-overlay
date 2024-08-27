# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for tty"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/nyagetty"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-apps/util-linux
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  exeinto /usr/libexec
  doexe "${FILESDIR}/dinit-agetty"
  doexe "${FILESDIR}/agetty-default"
  
  insinto /etc/dinit.d
  doins "${FILESDIR}/agetty"

  for i in $(seq 1 8); do
    doins "${FILESDIR}/agetty-tty${i}"
  done
}
