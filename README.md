# Dinit Overlay
This is a work in progress project to replace the gentoo init system with [dinit](https://github.com/davmac314/dinit).\
I see this as a desirable goal because dinit is a simple, portable software with superior service management capabilities
and the base of what's necessary for things like dependencies and user-level services
without jumping to overly complex solutions with less obvious system operations such as in the case of s6 or the 66 suite.

Additionally, I will work to support other alternative software such as [turnstile](https://github.com/chimera-linux/turnstile) and [mdevd](https://github.com/skarnet/mdevd).

This is first and foremost an effort to serve my minimalist interests, and the repo only secondly considers what works for others, 
while I will do my best to document the usage of this overlay, I cannot guarantee ubiquity.\
As a side effect of this, all work will be done with `ACCEPT_KEYWORDS="~amd64"` globally.
