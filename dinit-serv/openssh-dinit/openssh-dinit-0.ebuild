# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for openssh ssh daemon"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/openssh-dinit"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  net-misc/openssh
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/sshd"
  doins "${FILESDIR}/ssh-keygen"
}
