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
  # Currently in testing
  KEYWORDS="-*"
  SRC_URI="https://github.com/davmac314/${PN}/releases/download/v${PV}/${P}.tar.xz"
fi

LICENSE="Apache-2.0"
SLOT="0"

# system use flag has been repurposed, it is now the profile's job to select the
# core service set, the system use flag now only builds the halt binaries for
# running as init in conjunction with another installation
IUSE="sysv-utils +system"

#RDEPEND=""
#DEPEND=""
#BDEPEND=""
PDEPEND="
  sysv-utils? (
    !sys-apps/s6-linux-init[sysv-utils]
    !sys-apps/openrc[sysv-utils(-)]
    !sys-apps/systemd[sysv-utils]
    !sys-apps/sysvinit
  )
"

src_configure() {
  # Install sysvinit compatibility binaries prefixed as dinit- to coexist with
  # other service-managers when sysv-utils not set, for evaluation or development
  econf \
    --enable-shutdown=$(use system) \
    --shutdown-prefix=$(usex sysv-utils "" "dinit-")
}
