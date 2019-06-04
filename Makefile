#
# Copyright 2019 Gaël PORTAY
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

PREFIX ?= /usr/local

.PHONY: all
all:

.PHONY: doc
doc: cyberpower-pdu.1.gz

.PHONY: install-all
install-all: install install-doc install-bash-completion

.PHONY: install
install:
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 755 cyberpower-pdu $(DESTDIR)$(PREFIX)/bin/

.PHONY: install-doc
install-doc:
	install -d $(DESTDIR)$(PREFIX)/share/man/man1/
	install -m 644 cyberpower-pdu.1.gz $(DESTDIR)$(PREFIX)/share/man/man1/

.PHONY: install-bash-completion
install-bash-completion:
	completionsdir=$${BASHCOMPLETIONSDIR:-$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                             --variable=completionsdir \
	                             bash-completion)}; \
	if [ -n "$$completionsdir" ]; then \
		install -d $(DESTDIR)$$completionsdir/; \
		install -m 644 bash-completion $(DESTDIR)$$completionsdir/cyberpower-pdu; \
	fi

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cyberpower-pdu
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/cyberpower-pdu.1.gz
	completionsdir=$${BASHCOMPLETIONSDIR:-$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                             --variable=completionsdir \
	                             bash-completion)}; \
	if [ -n "$$completionsdir" ]; then \
		rm -f $(DESTDIR)$$completionsdir/cyberpower-pdu; \
	fi

.PHONY: user-install-all
user-install-all: user-install user-install-doc user-install-bash-completion

user-install user-install-doc user-install-bash-completion user-uninstall:
user-%:
	$(MAKE) $* PREFIX=$$HOME/.local BASHCOMPLETIONSDIR=$$HOME/.local/share/bash-completion/completions

.PHONY: check
check:
	shellcheck cyberpower-pdu

.PHONY: clean
clean:
	rm -f cyberpower-pdu.1.gz

%.1: %.1.adoc
	asciidoctor -b manpage -o $@ $<

%.gz: %
	gzip -c $^ >$@

# ex: filetype=make
