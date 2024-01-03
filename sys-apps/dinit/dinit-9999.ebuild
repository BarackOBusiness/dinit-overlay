# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools

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

# Dinit build docs recommend the usage of LTO, at this point in time
# it is unknown how to go about supporting this
#IUSE="lto"

#RDEPEND=""
#DEPEND=""
#BDEPEND=""

src_configure() {
  econf \
    --shutdown-prefix=dinit-
}
