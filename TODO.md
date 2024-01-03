# TODO Soon
- [x] Configure turnstile at prepare-time to install pam_turnstile.so
	to `/lib64/security` to be in line with the rest of gentoo.
- [x] Include `pam.d/system-login` patch with turnstile package ?
	specifically `-session optional pam_turnstile.so` needs to be added
- [x] Patch turnstile dinit backend to use appropriate dinit path 
	during exec
	(maybe change dinit install dir instead? undecided on this)
- [ ] Include dinit wrapper with dinit package to load both
	early boot and running service directories
- [x] Add LTO use flag for dinit package
- [ ] Look into how I can distribute wrapper commands and service
	files through portage to make installation as a system 
	service manager more painless

# TODO Eventually
- [ ] Working out-of-box dinit-rc package
- [ ] Profiles that target dinit, and pull in necessary services
	as expected and necessary
- [ ] Replace openrc
