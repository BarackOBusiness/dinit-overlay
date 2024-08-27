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

# system designates you wish to use dinit as a system service supervisor, and
# pulls in core services and agetty to allow you to boot to a login terminal
IUSE="+lto system"

#RDEPEND=""
#DEPEND=""
#BDEPEND=""
PDEPEND="
  system? (
    dinit-serv/base
    dinit-serv/agetty-dinit
  )"

src_configure() {
  if use lto ; then
    append-cflags -flto
    append-cxxflags -flto
  fi
  
  econf \
    --shutdown-prefix=dinit-
}
