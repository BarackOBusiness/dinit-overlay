# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools git-r3

DESCRIPTION="The dinit service supervision + init suite"
HOMEPAGE="https://github.com/davmac314/dinit"
EGIT_REPO_URI="https://github.com/davmac314/dinit.git"

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
