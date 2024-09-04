# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Dinit service description files for dbus daemon and user session"
HOMEPAGE="https://pkgs.chimera-linux.org/package/current/main/x86_64/dbus-dinit"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  sys-apps/dbus
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  insinto /etc/dinit.d
  doins "${FILESDIR}/dbus"
  insinto /etc/dinit.d/user
  newins "${FILESDIR}/dbus.user" "dbus"

  insinto /usr/lib/tmpfiles.d
  doins "${FILESDIR}/dbus.conf"

  exeinto /usr/libexec
  doexe "${FILESDIR}/dbus-session.wrapper"
}
