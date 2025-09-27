# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for various service managers"

SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

RDEPEND="
	!prefix-guest? (
		systemd? ( sys-apps/systemd )
		!systemd? ( || (
				sys-apps/openrc
				kernel_linux? ( || (
					sys-apps/dinit
					sys-apps/s6-rc
					sys-process/runit
				) )
			)
		)
	)
"
