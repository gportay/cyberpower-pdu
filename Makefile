#
# Copyright 2019 Gaël PORTAY
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

PREFIX ?= /usr/local

.PHONY: all
all:

.PHONY: install
install:
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 755 cyberpower-pdu $(DESTDIR)$(PREFIX)/bin/

.PHONY: install-bash-completion
install-bash-completion:
	completionsdir=$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                             --variable=completionsdir \
	                             bash-completion); \
	if [ -n "$$completionsdir" ]; then \
		install -d $(DESTDIR)$$completionsdir/; \
		install -m 644 bash-completion $(DESTDIR)$$completionsdir/cyberpower-pdu; \
	fi

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cyberpower-pdu
	completionsdir=$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                             --variable=completionsdir \
	                             bash-completion); \
	if [ -n "$$completionsdir" ]; then \
		rm -f $(DESTDIR)$$completionsdir/cyberpower-pdu; \
	fi

user-install user-install-bash-completion user-uninstall:
user-%:
	$(MAKE) $* PREFIX=$$HOME/.local

.PHONY: check
check:
	shellcheck cyberpower-pdu

# ex: filetype=make
