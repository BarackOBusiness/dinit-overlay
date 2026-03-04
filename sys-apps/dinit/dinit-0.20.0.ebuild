# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools flag-o-matic

DESCRIPTION="The dinit service supervision + init suite"
HOMEPAGE="https://github.com/davmac314/dinit"

if [[ ${PV} == 9999 ]]; then
  inherit git-r3
  EGIT_REPO_URI="https://github.com/davmac314/dinit.git"
else
  KEYWORDS="~amd64"
  SRC_URI="https://github.com/davmac314/${PN}/releases/download/v${PV}/${P}.tar.xz"
fi

LICENSE="Apache-2.0"
SLOT="0"

# system use flag has been repurposed, it is now the profile's job to select the
# core service set, the system use flag now only builds the halt binaries for
# running as init in conjunction with another installation
IUSE="sysv-utils +system"

DEPEND="
	sysv-utils? (
		!sys-apps/s6-linux-init[sysv-utils]
		!sys-apps/openrc[sysv-utils(-)]
		!sys-apps/systemd[sysv-utils]
		!sys-apps/sysvinit
	)
"
RDEPEND="${DEPEND}"
#BDEPEND=""
REQUIRED_USE="sysv-utils? ( system )"

src_configure() {
  # Install sysvinit compatibility binaries prefixed as dinit- to coexist with
  # other service-managers when sysv-utils not set, for evaluation or development
  econf \
    --enable-shutdown=$(use system) \
    --shutdown-prefix=$(usex sysv-utils "" "dinit-")
}

pkg_postinst() {
	echo
	ewarn "If you relied on this package to pull in the dinit base and getty services previously"
	ewarn "you should add those to your @world set now to not have them removed on depclean."
	elog "This overlay is in the process of being somewhat restructured to support fully"
	elog "replacing openrc instead of solely running alongside it, as such, some"
	elog "cleanups are happening to move ebuild behavior to where it's more appropriate."
	echo
}
