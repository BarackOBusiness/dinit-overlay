# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for tty"
# Unsure where I got this set of service descriptions but it was on my system
# HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/nyagetty"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-apps/util-linux
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  dodir "/etc/dinit.d/getty.d"
  doins "${FILESDIR}/getty"

  for i in $(seq 1 6); do
    doins "${FILESDIR}/tty${i}"
    dosym "/etc/dinit.d/tty${i}" "/etc/dinit.d/getty.d/tty${i}"
  done
}
