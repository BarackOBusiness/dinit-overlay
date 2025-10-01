# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Helper script for device management under dinit"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

# As of now this will only support systemd-utils udev, but an IUSE with options
# for mdevd or eudev can be added down the line
RDEPEND="
	sys-apps/systemd-utils[udev]
"

src_unpack() {
  mkdir "${S}" || die
}

src_install() {
  exeinto /usr/libexec
  newexe "${FILESDIR}/systemd-utils" "dinit-devd"
}
