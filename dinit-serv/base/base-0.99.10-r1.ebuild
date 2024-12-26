# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit meson

DESCRIPTION="A core collection of services to provide a booting system on dinit"
HOMEPAGE="https://github.com/chimera-linux/dinit-chimera"

if [[ $PV == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/chimera-linux/dinit-chimera.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/chimera-linux/dinit-chimera/archive/refs/tags/v${PV}.tar.gz"
	S="${WORKDIR}/dinit-chimera-${PV}"
fi

LICENSE="BSD-2"
SLOT=0

RDEPEND=""
DEPEND="
	>=sys-apps/dinit-0.18.0
	sys-apps/systemd-utils[tmpfiles,udev]
	sys-apps/kmod
	app-alternatives/sh
	app-alternatives/awk
	sys-apps/util-linux
"
# I'm unsure if app-alternatives/sh should've been put here, I don't know whether
# to just omit the shell depend or if this is okay assuming app-alternatives/sh
# is pulled in by the system set or something

src_prepare() {
	# This patch forces the installation to /usr/lib/ even on multilib systems, dinit will
	# not search /lib64/ and though it seems like the inverse of this patch should be
	# applied, it seems like more continuous maintenance
	# For now, we'll say this is in the interest of getting a reproducible dinit-booting
	# system in gentoo as easily as possible
	# Additionally, since Gentoo has tmpfiles covered, it removes that part of the
	# installation, since we don't want conflicts
	eapply "${FILESDIR}/mesonbuild.patch"
	# udevd symlink is pathed differently in chimera
	find ./ -type f -exec sed -i "s|exec/udevd|/systemd/systemd-udevd|" {} +
	# sd-tools as far as I'm concerned is not discernible from gentoo's systemd-utils yet
	find ./ -type f -exec sed -i "s|sd-tmpfiles|systemd-tmpfiles|" {} +

	eapply_user
}
