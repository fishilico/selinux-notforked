# Installation directories.
PREFIX ?= /usr
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale

.PHONY: all
all: chcat

install: all
	-mkdir -p $(BINDIR)
	install -m 755 chcat $(BINDIR)
	-mkdir -p $(MANDIR)/man8
	install -m 644 chcat.8 $(MANDIR)/man8/

clean:

indent:

relabel:

test:
