# Dinit Overlay
This is a work in progress project to replace the gentoo init system with [dinit](https://github.com/davmac314/dinit).\
I see this as a desirable goal because dinit is a simple, portable software with superior service management capabilities
and the base of what's necessary for things like dependencies and user-level services
without jumping to overly complex solutions with less obvious system operations such as in the case of s6 or the 66 suite.

Additionally, I will work to support other alternative software such as [turnstile](https://github.com/chimera-linux/turnstile) and [mdevd](https://github.com/skarnet/mdevd).

This is first and foremost an effort to serve my minimalist interests, and the repo only secondly considers what works for others, 
while I will do my best to document the usage of this overlay, I cannot guarantee ubiquity.\
As a side effect of this, all work will be done with `ACCEPT_KEYWORDS="~amd64"` globally.

## Stages of maturity
Right now this project is at the very least maturity stage as I have decided are the major milestones for the project. There are a few discernible phases I can see:
1. Packages the software
2. Packages external tools necessary to provide a dinit-booting system solely using portage
3. Can provide a dinit-booting system as merely a profile selection

The overlay currently only packages the software, and I have been running my system for a while off of manually installed service descriptions and scripts.\
This manual management is not good for keeping up to date nor is it good for sanity and bootstrapping ease, so I'm currently working towards at least the second phase.\
At that point one can then reasonably setup a fresh gentoo install, install dinit and the services they require and symlink to the init binary and have a dinit-booting system.
