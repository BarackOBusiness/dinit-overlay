# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson

DESCRIPTION="Session tracker project from chimera linux"
HOMEPAGE="https://github.com/chimera-linux/turnstile"

if [[ ${PV} == 9999 ]]; then
  inherit git-r3
  EGIT_REPO_URI="https://github.com/chimera-linux/turnstile.git"
else
  KEYWORDS="~amd64"
fi

LICENSE="BSD-2-Clause"
SLOT="0"

#RDEPEND=""
#DEPEND=""
BDEPEND="app-text/scdoc"

IUSE="+rundir"

src_configure() {
  local emesonargs=(
    $(meson_use rundir manage_rundir)
  )

  meson_src_configure
}
