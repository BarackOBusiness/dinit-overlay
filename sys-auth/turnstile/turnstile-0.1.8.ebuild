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
  SRC_URI="https://github.com/chimera-linux/${PN}/archive/refs/tags/v${PV}.tar.gz"
fi

LICENSE="BSD-2-Clause"
SLOT="0"

#RDEPEND=""
#DEPEND=""
BDEPEND="app-text/scdoc"

IUSE="+rundir"

src_prepare() {
  # Dinit as the user service manager will fail to start if not exec'd from its realpath.
  eapply "${FILESDIR}/fix-backend-exec-failure.patch"
  # It is noted in the dinit-chimera repo that init-local is a deprecated target.
  # Turnstile still targets this as of the current git, chimera images do not.
  eapply "${FILESDIR}/fix-turnstiled-service.patch"
  # This patch is currently hardcoded, but on a multilib 64 bit system, dinit-chimera will
  # install to /usr/lib64. Until I make some final decisions on where system services
  # should go *in gentoo*, I'm going to make this package work as well as possible under 
  # my system configuration.
  eapply "${FILESDIR}/multilib.patch"
  eapply_user
}

src_configure() {
  local emesonargs=(
    $(meson_use rundir manage_rundir)
    -Dpam_moddir=/lib64/security
  )

  meson_src_configure
}

src_install() {
  meson_src_install
  
  insinto /etc/pam.d
  doins "${FILESDIR}/system-login"
}
